module ProductsHelper

  def category_meth
    Category.all.map  { |i| [i.name, i.id ] }
  end


  def edit_category
    unless @product.categories.nil?
      @product.categories.map(&:attributes).to_json
    end
  end


end
