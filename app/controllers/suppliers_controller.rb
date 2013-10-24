class SuppliersController < ApplicationController

  respond_to :html
  before_filter :authenticate_user!
  
  def new
    @supplier = Supplier.new
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: SuppliersDatatable.new(view_context) }
    end
  end

  def create
    @supplier = current_user.suppliers.build(params[:supplier])
    @supplier.type_person = 'Proveedor' 
    if @supplier.save
      flash[:success] = t('flash.supplier', message: t('flash.created'))
    end
    respond_with @supplier
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(params[:supplier])
      flash[:success] = t('flash.supplier', message: t('flash.updated'))
    end
    respond_with @supplier
  end

end
