module CategoriesHelper

  def category_meth
    Category.all.map { |c| [c.name, c.id]  }
  end

end
