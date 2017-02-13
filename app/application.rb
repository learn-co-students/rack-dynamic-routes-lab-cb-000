class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      resp.write handle_item(item)
      if handle_item(item)=="Item not found"
        resp.status = 400
      else
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  def handle_item(search_term)
    price="Item not found"
    @@items.each do |i|
      if i.name == search_term
        price = "#{i.price}"
      end
    end
    return price
  end

end
