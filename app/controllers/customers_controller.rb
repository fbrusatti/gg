class CustomersController < ApplicationController

  respond_to :html, :js, :json
  before_filter :authenticate_user!

  def new
    @customer = Customer.new
  end

  def index
    respond_to do |format|
      format.html
      format.json do
        if params[:q].present?
          data = Customer.where("name ILIKE :search or
                                 surname ILIKE :search or
                                 dni ILIKE :search or
                                 registered_name ILIKE :search",
                                search: "%#{params[:q]}%")
        else
          data = CustomersDatatable.new(view_context)
        end
        render json: data
      end
    end
  end

  def create
    @customer = current_user.customers.build(params[:customer])
    @customer.type_person = 'Cliente'
    if @customer.save
      flash[:success] = t('flash.customer', message: t('flash.created'))
    end
    respond_with @customer
  end

  def show
    @customer = Customer.find(params[:id])
    respond_with @customer do |format|
      json_table = InvoicesDatatable.new(view_context, @customer)
      format.json { render json: {table: json_table, customer: @customer}}
    end
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
