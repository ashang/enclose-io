# Copyright (c) 2017 Minqi Pan <pmq2001@gmail.com>
# 
# This file is part of Enclose.IO, distributed under the MIT License
# For full terms see the included LICENSE file

class Win32Worker
  include Sidekiq::Worker
  sidekiq_options queue: 'win32'

  def perform(id)
    Executable.find(id).compile!
  end
end
