class ItemsController < ApplicationController
  respond_to :js, :json
  before_filter :authenticate_user!

  def create
    @product = Product.find params[:product]
    @item = Item.create(price_cost: @product.cost_price || 0,
                        price_sale: @product.list_price_one || 0,
                        price_vat: @product.vat.try(:percentaje) || 0,
                        price_descount: 0,
                        product_id: params[:product],
                        document_id: params[:invoice],
                        amount: 1)
    respond_with @item
  end

  def destroy
    @item = Item.find params[:id]
    @item.destroy
    respond_with @item do |format|
      format.js { render nothing: true }
    end
  end
end
