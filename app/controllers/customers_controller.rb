class CustomersController < ApplicationController
  
  respond_to :html
  
  def new
    @customer = Customer.new
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: CustomersDatatable.new(view_context) }
    end
  end

  def create
    @customer = current_user.customers.build(params[:customer])
    @customer.type_person = 'customer' 
    if @customer.save
      flash[:success] = t('flash.customer', message: t('flash.created'))
    end
    respond_with @customer
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
      flash[:success] = t('flash.customer', message: t('flash.updated'))
    end
    respond_with @customer
  end
end

