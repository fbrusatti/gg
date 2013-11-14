class ItemsController < ApplicationController
  respond_to :js, :json, :html
  before_filter :authenticate_user!

  def new
    @product = Product.find params[:product]
    @document = Invoice.find params[:invoice]
    @partial_stock = calculate_partial_stock(@document, @product)
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
    @partial_stock = calculate_partial_stock(@document, @product)
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
    def calculate_partial_stock(invoice, product)
      products = invoice.items.select { |i| i.product == product }
      products.inject(0) { |sum, p| sum + p.amount }
    end
end
