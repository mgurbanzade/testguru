module ApplicationHelper
  def resource_header(resource, name)
    return t(".new_#{name}") if resource.new_record?
    t(".edit_#{name}")
  end

  def form_button(resource)
    return t('create') if resource.new_record?
    t('update')
  end
end
