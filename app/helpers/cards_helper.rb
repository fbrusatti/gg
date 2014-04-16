module CardsHelper

  CARDS = %w{ credit debit }

  def card_type
    CARDS.map{ |t| [I18n.t(".cards.card_type.#{t}"), I18n.t(".cards.card_type.#{t}")] }
  end

end
