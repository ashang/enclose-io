# Copyright (c) 2017 Minqi Pan <pmq2001@gmail.com>
# 
# This file is part of Enclose.IO, distributed under the MIT License
# For full terms see the included LICENSE file

class Repository < ApplicationRecord
  belongs_to :user
  has_many :executables, dependent: :destroy # FIXME might be slow due to AWS S3
  
  validates :name, presence: true, length: { maximum: 214 }
  validate :validate_with_npm, if: 'errors.blank?'
  validate :validate_initial_version, if: 'npm_payload.present?'

  after_create :allocate_for_latest

  def source_url
    "https://www.npmjs.com/package/#{URI.escape name}"
  end

  def npm_registry_url
    "https://registry.npmjs.org/#{URI.escape name}"
  end
  
  def check
    self.npm_payload = JSON.parse(open(npm_registry_url).read)
    versions = npm_payload['versions'].keys
    x = versions.find_index(latest_version) + 1
    y = versions.size - 1
    x.upto(y).each do |index|
      allocate_for versions[index]
    end
    self.latest_version = npm_payload['versions'].keys.last
    self.save!
  end

  def validate_with_npm
    self.npm_payload = JSON.parse(open(npm_registry_url).read)
  rescue OpenURI::HTTPError => e
    if 404 == e.io.status.first.to_i
      errors.add(:name, '<code>'.html_safe + name + %Q{</code> was not
        registered in npm.<br>
        Please make sure
        <a href="#{npm_registry_url}">#{npm_registry_url}</a>
        exists first.}.html_safe)
    else
      raise e
    end
  end

  def validate_initial_version
    versions = npm_payload['versions'].keys
    versions.reverse_each.each do |version|
      if npm_payload['versions'][version]['bin'].present?
        self.latest_version = version
        break
      end
    end
    errors.add(:name, '<code>'.html_safe + name + %Q{</code>
      contains no binaries.<br>
      Please add a <code>bin</code> entry to your <code>package.json</code>
      first, e.g. <code>"bin": {"coffee": "./bin/coffee"}</code>.
    }.html_safe) if self.latest_version.blank?
  end
  
  def allocate_for(version)
    bins = npm_payload['versions'][version]['bin']
    return if bins.nil?
    bins.each do |name, _|
      Executable.create_for!(self, name, version)
    end
  end

  def allocate_for_latest
    allocate_for(latest_version)
    true
  end
end
