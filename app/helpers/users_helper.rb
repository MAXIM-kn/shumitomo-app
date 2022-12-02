module UsersHelper

  def unchecked_notifications
    @search_notifications = current_user.passive_notifications.where(checked: false)
  end
  
end
