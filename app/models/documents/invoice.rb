class Invoice < Document
  # == Callbakcs
  after_save :descount_amount, if: Proc.new { |i| i.creation_state == 'finish' }

  # == Accesors
  attr_accessible :product_tokens
  attr_reader :product_tokens

  def product_tokens=(id)
    self.product_id = id
  end

  private
    def descount_amount
      self.items.each do |i|
        i.product.stock -= i.amount
        i.product.save
      end
    end
end
