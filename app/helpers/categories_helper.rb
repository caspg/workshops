module CategoriesHelper
  # Return true if current_user exist and is admin, false otherwise.
  def current_user_admin?
    if user_signed_in?
      current_user.admin?
    end
  end
end
