class Application #define the class

  @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)] #create an array of items
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/) #if the path matches the items
      item_name = req.path.split("/items/").last
      if item =@@items.find{|i| i.name == item_name} #and the item is in the array
        resp.write item.price #then respond with item price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status=404 #otherwise respond with errors
      resp.write "Route not found"
    end
    resp.finish
  end

end
