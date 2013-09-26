module ApplicationHelper

  def errors_for(object, message=nil)
    html = ""
    unless object.errors.blank?
      html << "<div class='formErrors #{object.class.name.humanize.downcase}Errors'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5> #{t("flash.error_create_form")} </h5>\n"
        else
          html << "\t\t<h5> #{t("flash.error_update_form")} </h5>\n"
        end
      else
        html << "<h5>#{message}</h5>"
      end
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html
  end

 def edit_or_new_page?(object)
    current_page?(action: 'new') ||
    current_page?(action: 'edit', id: object || 0) ||
    (object.errors.present? if object.present?)
  end

  def show_page?(object)
    current_page?(action: 'show', id: object || 0)
  end
end
