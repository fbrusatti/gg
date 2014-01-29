class AllInvoicesDatatable
  include ApplicationHelper
  delegate :simple_format, :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Invoice.count,
      iTotalDisplayRecords: invoices.count,
      aaData: data
    }
  end

private

  def data
    invoices.map do |invoice|
      [
        h(invoice.number),
        h(invoice.invoice_type),
        customer(invoice),
        state(invoice),
        number_to_currency(invoice.amount, precision: 2),
        print_date(invoice.updated_at, :date_and_time)
      ]
    end
  end

  def invoices
    fetch_invoices
  end

  def fetch_invoices
    invoices = Invoice.order("#{sort_column} #{sort_direction}")
    invoices = invoices.joins("LEFT OUTER JOIN customers ON customers.id = documents.customer_id")
    invoices = invoices.page(page).per_page(per_page)
    if params[:sSearch].present?
      invoices = invoices.where("number = :n_search or
                                 documents.id =  :n_search or
                                 state ilike :s_search or
                                 name ilike :s_search or
                                 surname ilike :s_search or
                                 registered_name ilike :s_search",
                                 s_search: "%#{params[:sSearch]}%",
                                 n_search: params[:sSearch].to_i)
    end
    if params[:sSearch_1].present?
      invoices = invoices.where(invoice_type: params[:sSearch_1])
    end
    if params[:sSearch_3].present?
      invoices = invoices.where(state: params[:sSearch_3])
    end
    invoices
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[number invoice_type registered_name state amount updated_at]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def customer(invoice)
    name, path = invoice.customer.try(:name_to_invoice) || "", invoice.customer
    link_to name, path
  end

  def state(invoice)
    klasses = { confirmed: 'primary', paid: 'success', canceled: 'default', partially_paid: 'label-info' }
    texts = { confirmed: 'comfirmada', paid: 'pagada', canceled: 'candelada', partially_paid: 'parcialmente paga' }
    klass = klasses[invoice.state.try :to_sym]
    text = texts[invoice.state.try :to_sym]
    simple_format text, class: "label #{klass}"
  end
end
