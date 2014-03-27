module InvoicesHelper

  STATES = %w(confirmed paid canceled partially_paid)
  INVOICE_TYPE = %w(A B C)
  def states
    STATES.map { |s| [I18n.t("invoices.states.#{s}"), s]}
  end

  def invoice_type
    INVOICE_TYPE.map { |t| [t, t]}
  end
end
