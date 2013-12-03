class ReceiptsController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!


  def new
    @receipt = Receipt.new
  end

  def create
  end

end
