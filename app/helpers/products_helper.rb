module ProductsHelper

  def category_meth
    Category.all.map  { |i| [i.name, i.id ] }
  end


  def edit_category
    @product.categories.map(&:attributes).to_json if @product.categories.present?
  end


end
