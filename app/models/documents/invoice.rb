class Invoice < Document

  # == Accesors
  attr_accessible :product_tokens
  attr_reader :product_tokens

  def product_tokens=(id)
    self.product_id = id
  end
end
