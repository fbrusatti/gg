class InvoiceItemsDatatable

  delegate :content_tag, :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view, invoice)
    @invoice = invoice
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: items.count,
      iTotalDisplayRecords: items.count,
      aaData: data
    }
  end

private

  def data
    items.map do |item|
      [
        h(item.product.code),
        h(item.product.description),
        h(item.amount),
        h(item.net_cost),
        h(item.price_descount),
        h(item.price_vat),
        h(item.total_price),
        h(actions(item))
      ]
    end
  end

  def items
    @invoice.items.order(:created_at)
  end

  def actions item
    remove = link_to (content_tag :i, nil, class: "icon-remove icon-2x"),
            item,
            method: :delete,
            remote: true,
            class: 'delete-item'
    edit = link_to (content_tag :i, nil, class: "icon-pencil icon-2x"),
            item,
            remote: true,
            class: 'open-edit-item-modal'
    edit + remove
  end
end
