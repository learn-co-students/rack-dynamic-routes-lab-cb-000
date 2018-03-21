class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new()
    req = Rack::Request.new(env)

    path = req.path
    item_name = req.path.split('/').last
    if path.include? "item"
      found_item = @@items.select {|item| item.name == item_name}.first
      if found_item
        resp.write(found_item.price)
        resp.status = 200
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
