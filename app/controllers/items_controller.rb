class ItemsController < ApplicationController
  respond_to :js, :json, :html
  before_filter :authenticate_user!

  def new
    @product = Product.find params[:product]
    @document = Invoice.find params[:invoice]
    @pstock = calculate_partial_stock @product
    @item = Item.new
    render partial: 'add_item'
  end

  def create
    @item = Item.create params[:item]
    render nothing: true
  end

  def destroy
    @item = Item.find params[:id]
    @item.destroy
    respond_with @item do |format|
      format.js { render nothing: true }
    end
  end

  def show
    @item = Item.find params[:id]
    @document = @item.document
    @product = @item.product
    @pstock = calculate_partial_stock @product
    render partial: 'edit_item'
  end

  def update
    @item = Item.find params[:id]
    @item.update_attributes params[:item]
    respond_with @item do |format|
      format.js { render nothing: true }
    end
  end

  private
    def calculate_partial_stock product
      @document.items.inject(0){ |sum, i| sum + i.amount if i.product == product }
    end
end
