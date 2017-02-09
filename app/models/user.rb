# Copyright (c) 2017 Minqi Pan <pmq2001@gmail.com>
# 
# This file is part of Enclose.IO, distributed under the MIT License
# For full terms see the included LICENSE file

class User < ApplicationRecord
  ADMINISTRATORS = [ 'pmq20', 'shaoshuai0102' ]

  has_many :projects

  devise :database_authenticatable, :omniauthable, :trackable

  scope :administrators, -> { where(login: ADMINISTRATORS) }

  def self.from_omniauth(auth)
   where(github_uid: auth.uid).first_or_create do |user|
     user.login = auth.info.nickname
     user.email = auth.info.email
     user.name = auth.info.name
     user.github_access_token = auth.credentials.token
     user.github_payload = auth
   end
  end

  def github_client
    @github_client ||= Octokit::Client.new(access_token: github_access_token)
  end

  def authenticatable_salt
    nil
  end

  def admin?
    ADMINISTRATORS.include? login
  end

  def github_link
    "https://github.com/#{login}"
  end
end
