module DocumentsHelper
  STATES = %w(init finish building)
  DOCUMENT_TYPE = %w(A B C)
  DOCUMENT_NAME = %w(Invoice Receipt)
  BALANCE_TYPE = %w(debts not_debts)
  ANNUL_STATUS = %w(annul not_annul)

  def document_states
    STATES.map { |s| [I18n.t("invoices.states.#{s}"), s]}
  end

  def document_type
    DOCUMENT_TYPE.map { |t| [t, t]}
  end

  def document_name
    DOCUMENT_NAME.map { |t| [I18n.t("documents.document_name.#{t}"), t]}
  end

  def balance_type
    BALANCE_TYPE.map { |t| [I18n.t("documents.document_balance.#{t}"), t]}
  end

  def annul_status
    ANNUL_STATUS.map { |s| [I18n.t(".documents.document_status.#{s}"), s]}
  end

  def annul(document)
    text = document.annul ? I18n.t('documents.document_status.annul')
                          : I18n.t('documents.document_status.not_annul')
    label = document.annul ? 'label label-danger' : 'label label-success'
    return text, label
  end

  def payment_condition(document)
    result =  case document.payment_condition
    when "1" then I18n.t("documents.payment_condition.current_acount")
    when "2" then I18n.t("documents.payment_condition.cash")
    end
    return result
  end

end
