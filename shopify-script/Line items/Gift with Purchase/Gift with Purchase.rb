# Check that we have at least two items in the cart (so that there's a "purchase").
if Input.cart.line_items.size > 1
  
  # Look at each product tag  
  Input.cart.line_items.each do |line_item|
    
    # Extract tag from array 
    product_tag_special = line_item.variant.product.tags
    
       # If the special_product tag found in line item.
       if product_tag_special.include? 'special_product'
         
         # Look at each product tag  
           Input.cart.line_items.each do |line_item|
             
             # Extract tag from array 
             product_tag_free = line_item.variant.product.tags
             
                is_in_cart = false
              
                #Check if the Product Tag is in the cart Item
                 if product_tag_free.include? 'FREE'
                   
                  is_in_cart = true
                  
                 end
               
                # Here making free product
                if is_in_cart
                          
                   if line_item.quantity > 1

                      line_item = line_item.split(take: 1)
              
                      Input.cart.line_items << line_item
              
                    end
              
                  line_item.change_line_price(Money.zero, message: "Free gift with purchase!")
                
               end   
              
            end
           
        end 
   
     end  

  end  

# Export the cart.

Output.cart = Input.cart