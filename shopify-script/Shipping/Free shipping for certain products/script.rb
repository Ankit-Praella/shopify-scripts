   # Assign Freeshipping product tag 
   FREE_SHIPPING_TAG = 'free_ship'
   
     # Assign country code    
     shipping_address = Input.cart.shipping_address.country_code
     
      # Checking country code and free shipping tag  
      if shipping_address == 'US' or shipping_address == 'IN' && Input.cart.line_items.any?{ |item| item.variant.product.tags.include? FREE_SHIPPING_TAG}
       
       # Iteration of shipping rates loop 
       Input.shipping_rates.each do |shipping_rate|
         
       # Skip loop's next iteration   
       next if shipping_rate.price == Money.zero 
       
       # Applies a discount of the specified fixed amount 
       shipping_rate.apply_discount(shipping_rate.price, { message: "Free Shipping!" })
      
      # Using Break Statement 
      break
  
    end
      
  end

# Export the shipping
Output.shipping_rates = Input.shipping_rates