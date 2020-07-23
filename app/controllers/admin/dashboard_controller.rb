class Admin::DashboardController < AuthenticationController
  def show
    @productCount = Product.count 
    @categoryCount = Category.count
  end
end
