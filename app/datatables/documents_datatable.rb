class DocumentsDatatable
  include ApplicationHelper
  include DocumentsHelper
  delegate :simple_format, :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Document.count,
      iTotalDisplayRecords: documents.count,
      aaData: data
    }
  end

private

  def data
    documents.map do |document|
      [
        build_link(document, document.id),
        state(document),
        build_link(document, document.invoice_type),
        build_link(document, document.number),
        customer(document),
        print_date(document.emission_at, :date),
        number_to_currency(document.amount, precision: 2),
        state_balance(document),
        h(payment_condition(document)),
        h(document_annul(document))
      ]
    end
  end

  def documents
    fetch_documents
  end

  def fetch_documents
    documents = Document.order("#{sort_column} #{sort_direction}")
    documents = documents.joins("LEFT OUTER JOIN customers ON customers.id = documents.customer_id")
    documents = documents.page(page).per_page(per_page)
    if params[:sSearch].present?
      documents = documents.where("number = :n_search or
                                 documents.id =  :n_search or
                                 name ilike :s_search or
                                 surname ilike :s_search or
                                 registered_name ilike :s_search",
                                 s_search: "%#{params[:sSearch]}%",
                                 n_search: params[:sSearch].to_i)
    end
    if params[:sSearch_1].present?
      documents = documents.where(type: params[:sSearch_1])
    end
    if params[:sSearch_2].present?
      documents = documents.where(invoice_type: params[:sSearch_2])
    end
    if params[:sSearch_5].present?
      documents = documents.where(creation_state: params[:sSearch_5])
    end
    if params[:sSearch_7].present?
      sing = params[:sSearch_7] == "debts" ? ">" : "="
      documents = documents.where("balance "+ sing +" 0")
    end
    if params[:sSearch_9].present?
      sing = params[:sSearch_9] == "annul"
      documents = documents.where(annul: sing)
    end
    documents.includes(:customer)
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id type invoice_type number registered_name
                amount balance emission_at payment_condition annul]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def customer(document)
    name, path = document.customer.try(:complete_name) || "", document.customer
    link_to name, path
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

  def document_annul(document)
    text, label = annul(document)
    simple_format text, class: label
  end

  def build_link(document, name)
    link_to name || "", document
  end
end
