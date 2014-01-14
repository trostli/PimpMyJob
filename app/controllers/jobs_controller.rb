class JobsController < ApplicationController

  def import
    Job.import(params[:file])
    redirect_to root_url, notice:"Jobs imported."
  end

  def upload

  end

end