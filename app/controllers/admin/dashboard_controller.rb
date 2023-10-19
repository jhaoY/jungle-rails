class Admin::DashboardController < Admin::BaseController

  def show
    @product = Product.all()
    @category = Category.all()
  end
  
end
