class CleanersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @cleaners = Cleaner.all
  end

  def show
    @cleaner = Cleaner.find(params[:id])
  end
end
