class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'], only: [:show]

  def show
    @product_count = Product.count
    @category_count = Category.count
  end

  def destroy
    request.headers['Authorization'] = nil
    # p request.headers['Authorization']
    redirect_to '/'
  end
end
