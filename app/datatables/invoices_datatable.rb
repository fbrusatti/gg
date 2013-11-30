class InvoicesDatatable
  
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view, customer)
    @view = view
    @customer = customer
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Invoice.count,
      iTotalDisplayRecords: invoices_list.count,
      aaData: data
    }
  end

private

  def data
    invoices_list.map do |invoice|
      [
        link_to(invoice.id, invoice),
        h(invoice.customer_id),
        h(invoice.amount),
        h(invoice.balance)
      ]
    end
  end

  def invoices_list
    @invoices_list ||= fetch_invoices
  end

  def fetch_invoices
    invoices_list = @customer.invoices.order("#{sort_column} #{sort_direction}")
    invoices_list = invoices_list.page(page).per_page(per_page)
    if params[:sSearch].present?
      invoices_list = invoices_list.where("amount ilike :search or balance ilike :search", 
                                  search: "%#{params[:sSearch]}%")
    end
    invoices_list
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id customer_id amount balance]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
