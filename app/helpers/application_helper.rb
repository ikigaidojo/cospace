module ApplicationHelper
  # This bit of codes will help to use devise forms to another page
  def resource_name
    :member
  end

  def resource
    @resource ||= Member.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:member]
  end
end
