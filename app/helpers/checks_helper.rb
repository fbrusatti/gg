module ChecksHelper

 STATUS = %w{in_folder returned charged}

 def check_status
    STATUS.map{ |s| [I18n.t(".checks.status.#{s}"), I18n.t(".checks.status.#{s}")] }
 end

 def link_bank(bank)
    path, link = "",""
    if bank.present?
      path =  bank_path(bank)
      link = bank.complete_name.truncate(45)
      link_to link, path, class: "note"
    else
      label_tag ""
    end
  end


end
