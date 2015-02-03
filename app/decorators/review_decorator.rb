class ReviewDecorator < Draper::Decorator
  delegate_all

  # Return string with author's fullname.
  def author
    if user.firstname && user.lastname  
      user.firstname + ' ' + user.lastname
    else 
      'not given'
    end
  end
end
