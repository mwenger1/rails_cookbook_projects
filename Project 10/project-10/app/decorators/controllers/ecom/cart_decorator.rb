# require_dependency "ecom/application_controller"

# Ecom::CartController.class_eval do
#  def checkout
#     @cart.checkout!
#     session.delete(:cart_id)
#     flash[:notice] = "Thank your for the Order! We will e-mail you with the shipping info."
#     redirect_to root_path
#   end
# end