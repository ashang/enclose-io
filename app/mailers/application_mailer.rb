# Copyright (c) 2017 Minqi Pan <pmq2001@gmail.com>
# 
# This file is part of Enclose.IO, distributed under the MIT License
# For full terms see the included LICENSE file

class ApplicationMailer < ActionMailer::Base
  default from: 'support@enclose.io'
  layout 'mailer'
end
