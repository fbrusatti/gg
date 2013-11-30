class ReceiptsController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!


  def new
    @receipt = Receipt.new
    respond_to do |format|
      format.html
      format.json { render json: ProductsDatatable.new(view_context) }
    end
  end

  def create
  end

end
