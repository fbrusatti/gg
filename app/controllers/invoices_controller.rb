class InvoicesController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def new
  end

  def create
  end
end
