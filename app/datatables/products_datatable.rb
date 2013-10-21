class ProductsDatatable
  
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Product.count,
      iTotalDisplayRecords: prducts.total_entries,
      aaData: data
    }
  end

private

  def data
    prducts.map do |product|
      [
        link_to(product.code, product),
        h(product.description),
        h(product.stock),
        h(product.minimun_stock),
        h(Category.find(product.category_id).name),
        h(product.list_price_one),
        h(product.list_price_two),
      ]
    end
  end

  def prducts
    @prducts ||= fetch_prducts
  end

  def fetch_prducts
    prducts = Product.order("#{sort_column} #{sort_direction}")
    prducts = prducts.page(page).per_page(per_page)
    if params[:sSearch].present?
      prducts = prducts.where("code ilike :search or description ilike :search", 
                                  search: "%#{params[:sSearch]}%")
    end
    prducts
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[code description stock category list_price_one list_price_two]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end