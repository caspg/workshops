class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :authenticate_admin, only: [:new, :edit, :update, :destroy, :create]
  
  expose(:categories)
  expose(:category)
  expose(:product) { Product.new }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.category = Category.new(category_params)

    if category.save
      redirect_to category, flash: { success: 'Category was successfully created.' }
    else
      render action: 'new'
    end
  end

  def update
    if category.update(category_params)
      redirect_to category, flash: { success: 'Category was successfully updated.' }
    else
      render action: 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, flash: { success: 'Category was successfully destroyed.' }
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    # Redirect user to new_user_session_path if not admin
    def authenticate_admin
      if !current_user || !current_user.admin?
        redirect_to new_user_session_path
      end
    end
end
