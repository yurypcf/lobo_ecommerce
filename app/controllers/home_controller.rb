class HomeController < ApplicationController
  def index
    @products = Product.where(active: true).order(:name)
  end
end
