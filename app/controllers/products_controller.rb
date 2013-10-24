class ProductsController < ApplicationController

  respond_to :html
  before_filter :authenticate_user!
  
  def new
    @product = Product.new
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: ProductsDatatable.new(view_context) }
    end
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = t('flash.product', message: t('flash.created'))
    end
    respond_with @product
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success] = t('flash.product', message: t('flash.updated'))
    end
    respond_with @product
  end

end
