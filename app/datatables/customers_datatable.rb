class CustomersDatatable
  
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Customer.count,
      iTotalDisplayRecords: customers.total_entries,
      aaData: data
    }
  end

private

  def data
    customers.map do |customer|
      [
        link_to(customer.name, customer),
        h(customer.surname),
        h(customer.dni),
        h(customer.address),
        h(customer.email),
      ]
    end
  end

  def customers
    @customers ||= fetch_customers
  end

  def fetch_customers
    customers = Customer.order("#{sort_column} #{sort_direction}")
    customers = customers.page(page).per_page(per_page)
    if params[:sSearch].present?
      customers = customers.where("name like :search or surname like :search", search: "%#{params[:sSearch]}%")
    end
    customers
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name surname dni address email]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end