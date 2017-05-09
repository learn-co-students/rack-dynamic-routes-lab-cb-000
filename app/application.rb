class Application
  @@item = Item.all
  



 def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last

           item_obj = @@item.find { |item| item.name == item_name}
           if item_obj != nil
             resp.write "#{item_obj.price}" unless item_obj == nil

           else
             resp.write "Item not found"
             resp.status = 400
           end
    else
         resp.write "Route not found"
         resp.status = 404
    end
    resp.finish
end



end
