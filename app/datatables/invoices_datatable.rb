class InvoicesDatatable
  
  delegate :simple_format, :params, :h, :link_to, :number_to_currency, to: :@view

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
        h(invoice.id),
        state(invoice),
        h(invoice.number),
        h(invoice.emission_at),
        h(invoice.amount),
        state_balance(invoice)
      ]
    end
  end

  def invoices_list
    @invoices_list ||= fetch_invoices
  end

  def fetch_invoices
    invoices_list = @customer.invoices.order("#{sort_column} #{sort_direction}")
    invoices_list = invoices_list.where("balance > 0")
    invoices_list = invoices_list.page(page).per_page(per_page)
    if params[:sSearch].present?
      invoices_list = invoices_list.where("amount ilike :search or balance ilike :search
                                           emission_at ilike :search or number ilike :search", 
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
    columns = %w[id type number emission_at amount balance]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def state(document)
    name = I18n.t("documents.document_name.#{document.type}")
    klasses = { init: 'default', building: 'info', finish: 'success'}
    klass = klasses[document.creation_state.try :to_sym]
    link_to name, document, class: "label #{klass}"
  end

  def state_balance(document)
    number = number_to_currency(document.balance, precision: 2)
    if document.balance.present? && document.balance > 0
      simple_format number, class: "label danger"
    else
      number
    end
  end

end
