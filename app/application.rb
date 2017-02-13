class Application
  @@items = [Item.new("Monkey Plush", 18.34) , Item.new("Apple", 3.42) , Item.new("Ipod" , 199.99)]

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/items/"
      item_param = req.path.split('/items/').last

      resp.write check_item(item_param)

      if check_item(item_param) == "Item not found"
        resp.status = 400 # Item not found
      else
        resp.status = 200 # Item found
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  def check_item(item)
    price = "Item not found"
    @@items.each do |i|
      if i.name == item
        price = "#{i.price}"
      end
    end
    price
  end

end
