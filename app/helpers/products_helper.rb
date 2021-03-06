module ProductsHelper
  # Return true if current_user exist and is product's owner, false otherwise.
  def current_user_owner?(product = product)
    if user_signed_in?
      current_user == product.user || current_user.admin
    end
  end
end
