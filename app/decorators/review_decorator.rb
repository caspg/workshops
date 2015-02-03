class ReviewDecorator < Draper::Decorator
  delegate_all

  # Return string with author's fullname.
  def author 
    user.firstname + ' ' + user.lastname
  end
end
