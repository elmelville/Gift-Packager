class ProductUpdatesController < ApplicationController

  around_filter :shopify_session

  def add_base_tag
    product = ShopifyAPI::Product.find(params[:id])
    product.tags = 'base_product'
    product.save
    redirect_to '/'
  end  

  def remove_base_tag
    product = ShopifyAPI::Product.find(params[:id])
    product.tags = ''
    product.save
    redirect_to '/'
  end   
  
end


  