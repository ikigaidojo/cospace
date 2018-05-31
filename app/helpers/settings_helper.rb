module SettingsHelper

  def account_information(active_panel)
    return active_panel == 1 ? " active " : ""
  end

  def password_reset(active_panel)
    result = active_panel == 2 ? " active " : ""
    return result
  end

  def notification(active_panel)
    return active_panel == 3 ? " active " : ""
  end

  def payment_methods(active_panel)
    return active_panel == 4 ? "active" : ""
  end
end
