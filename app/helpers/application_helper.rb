module ApplicationHelper

  def current_user_has?(instance)
    user_signed_in? && current_user.id == instance.user_id
  end

end