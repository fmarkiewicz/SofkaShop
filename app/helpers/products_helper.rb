module ProductsHelper

    def last_products
        html = ""
        products = Product.order(:created_at).first(3)
        products.each_with_index do |product, index|
            html += content_tag(:div, class: "item #{ 'active' if index == 0 }") do
                image_tag(product.product_image.url(:original), class: "center-block")+ 
                content_tag(:div, class: "carousel-caption") do
                    content_tag(:h3, product.name)+
                    content_tag(:p, product.description)+
                    content_tag(:h4, price_in_float(product.price_in_int))
                end    
            end
        end
        html.html_safe
    end

end
