class Application
  @@items = [Item.new("Apples", 50), Item.new("Figs", 150), Item.new("Pears", 75)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      input_item = req.path.split("/items/").last

      item_found = @@items.find { |item| item.name == input_item}

      if item_found
        resp.write item_found.price
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
