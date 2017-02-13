# Copyright (c) 2017 Minqi Pan <pmq2001@gmail.com>
# 
# This file is part of Enclose.IO, distributed under the MIT License
# For full terms see the included LICENSE file

class SessionsController < Devise::SessionsController
  def new
    flash.clear
    redirect_to user_github_omniauth_authorize_path
  end
end
