class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_categories, :set_countries, :set_cart

  private

  def set_categories
    @categories = Category.all
  end

  def set_countries
    @countries = ISO3166::Country.all.sort_by(&:name)
  end

  def set_cart
    if user_signed_in?
      @cart = current_user.cart || add_cart_to_user
    elsif session[:cart_id]
      @cart = Cart.find_by(id: session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @cart = @cart.decorate
  end

  def add_cart_to_user
    session[:cart_id] = nil
    current_user.cart = Cart.create
  end
end
