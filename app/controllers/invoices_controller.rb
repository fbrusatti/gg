class InvoicesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def show
    @invoice = Invoice.find params[:id]
    respond_with @item do |format|
      respond = InvoiceItemsDatatable.new(view_context, @invoice)
      format.json { render json: respond }
    end
  end


  def index
    respond_to do |format|
      format.html
      format.json { render json: InvoicesDatatable.new(view_context) }
    end
  end

  # creation_state: init by default
  def new
    @invoice = current_user.invoices.create unless request.xhr?
    respond_with @invoice
  end

  # change creation_state to finish or building
  def update
    @invoice = Invoice.find params[:id]
    @invoice.update_attributes params[:invoice]
    respond_with @invoice, location: invoices_path
  end

  def destroy
    @invoice = Invoice.find params[:id]
    @invoice.destroy
    respond_with @invoice
  end
end
