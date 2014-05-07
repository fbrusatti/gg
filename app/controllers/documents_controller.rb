class DocumentsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    respond_to do |format|
      format.html
      format.json { render json: DocumentsDatatable.new(view_context) }
    end
  end
end
