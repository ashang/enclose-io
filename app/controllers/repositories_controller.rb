# Copyright (c) 2017 Minqi Pan <pmq2001@gmail.com>
# 
# This file is part of Enclose.IO, distributed under the MIT License
# For full terms see the included LICENSE file

class RepositoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  
  def index
    if params[:mine]
      authenticate_user!
      @repositories = current_user.repositories
    else
      @repositories = Repository.hot
    end
  end

  def show
    @repository = Repository.find(params[:id])
    @subtitle = @repository.name
  end
end
