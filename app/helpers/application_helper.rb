module ApplicationHelper
  def resource_header(resource, name)
    resource.new_record? ? t(".new_#{name}") : t(".edit_#{name}")
  end

  def form_button(resource)
    resource.new_record? ? t('create') : t('update')
  end

  def flash_message
    flash.map do |key, value|
      content_tag :div, class: "alert alert-#{key}" do
        value
      end
    end.join.html_safe
  end
end
