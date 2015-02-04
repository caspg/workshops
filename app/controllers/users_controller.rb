class UsersController < ApplicationController
  expose_decorated(:reviews, ancestor: :product)

  def show
     @user = User.find(params[:id])
     @reviews = @user.reviews.order('created_at desc').limit(5)
   end 
end
