module ProductsHelper

  def category_meth
    Category.all.map  { |i| [i.name, i.id ] }
  end

end
