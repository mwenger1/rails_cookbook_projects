class CartController < Ecom::CartController
    before_filter :authenticate_user!
    before_filter :get_cart_value
    
  def add
    @cart.save
    session[:cart_id] = @cart.id
    product = Product.find(params[:id])
    item = LineItem.new
    item.make_items(@cart.id, product.id, product.base_price)
    @cart.recalculate_price!
    flash[:notice] = "Product Added to Cart"
    redirect_to cart_path
  end

  def remove
    item = @cart.line_items.find(params[:id])
    item.destroy
    @cart.recalculate_price!
    flash[:notice] = "Product Deleted from Cart"
    redirect_to cart_path
  end

  def checkout
    @cart.checkout!
    session.delete(:cart_id)
    flash[:notice] = "Thank your for the Order! We will e-mail you with the shipping info."
    redirect_to root_path
  end

  protected

  def get_cart_value
    if session[:cart_id].nil?
     @cart = Purchase.create
     session[:cart_id] = @cart.id
     @cart
    else
     @cart = Purchase.find(session[:cart_id])
    end
  end

end
