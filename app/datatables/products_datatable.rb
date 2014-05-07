class ProductsDatatable

  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Product.count,
      iTotalDisplayRecords: products.total_entries,
      aaData: data
    }
  end

private

  def data
    products.map do |product|
      [
        link_to(product.code, product),
        h(product.description),
        h(product.categories.first.try :name),
        h(product.stock),
        h(product.minimun_stock),
        h(product.list_price_one),
        h(product.list_price_two),
        h(product.gondola),
        h(product.shelf)
      ]
    end
  end

  def products
    @products ||= fetch_products
  end

  def fetch_products
    products = Product.order("#{sort_column} #{sort_direction} nulls last")
    products = products.page(page).per_page(per_page)
    if params[:sSearch].present?
      products = products.joins(:categories)
      products = products.where("products.description ilike :search
                                 or categories.name ilike :search
                                 or products.code ilike :search",
                                 search: "%#{params[:sSearch]}%")
    end

    if params[:search_category].present?
      products = products.joins(:categories)
      products = products.where("categories.name ilike :search",
                                 search: "%#{params[:sSearch_2]}%")
    end
    if params[:search_code].present?
      products = products.where("products.code ilike :search",
                                 search: "%#{params[:sSearch_0]}%")
    end
    if params[:search_description].present?
      products = products.where("products.description ilike :search",
                                 search: "%#{params[:sSearch_1]}%")
    end
    products.includes(:categories)
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[code description category stock minimun_stock list_price_one list_price_two gondola shelf]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
