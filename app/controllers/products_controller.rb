class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :create, :update, :destroy]
  before_action :authenticate_owner, only: [:edit, :update, :destroy]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = current_user.products.build(product_params)

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), success: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), success: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), success: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  # Test if current user is product owner. If not redirect to product.
  def authenticate_owner 
    if current_user != product.user
      redirect_to category_product_url(category, product), danger: 'You are not allowed to edit this product.'
    end
  end
end
