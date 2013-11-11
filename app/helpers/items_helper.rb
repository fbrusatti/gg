module ItemsHelper
  LIST_PRICE = %w{list_price_one list_price_two list_price_three}

  def list_prices product
    LIST_PRICE.inject([]) do |result, p|
      result << [t("activerecord.attributes.product.#{p}"),
                product.send("#{p}")] if product.send("#{p}")
      result
    end
  end
end
