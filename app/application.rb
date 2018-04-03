class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      resp.write handle_items(item)
      if handle_items(item)=="Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

  def handle_items(search_item)
    item = Item.all.find{|item| item.name==search_item}
    return item ? item.price : "Item not found"
  end
end
