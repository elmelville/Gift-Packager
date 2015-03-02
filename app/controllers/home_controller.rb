class HomeController < ApplicationController
  
  around_filter :shopify_session, :except => 'welcome'
  
  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end
  
  def index
    # get latest 250 orders
    @products = []
    @productCount = ShopifyAPI::Product.count
    @pageCount = (@productCount / 250) + 1
    for pageNum in 1..@pageCount
	    @products[pageNum]   = ShopifyAPI::Product.find(:all, :params => {:limit => 250, :page => pageNum })
    end
  end
  
end