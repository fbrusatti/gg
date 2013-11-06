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
        h(item.price_cost),
        h(item.product.list_price_one),
        h(item.price_descount),
        h(item.price_vat),
        h(price_total(item)),
        h(remove(item))
      ]
    end
  end

  def items
    @invoice.items.order(:created_at)
  end

  def price_total item
    ncost = net_cost item
    tprice = ncost - ncost * item.price_descount / 100
    tprice - tprice * item.price_vat / 100
  end

  def net_cost item
    item.price_cost + (item.price_sale * item.price_cost) / 100
  end

  def remove item
    link_to (content_tag :i, nil, class: "icon-remove icon-2x"),
            item,
            method: :delete,
            remote: true,
            class: 'delete-item'
  end
end
