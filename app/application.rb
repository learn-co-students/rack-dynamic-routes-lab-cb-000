class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("/items/")
      search_item = req.path.split( "/items/").last
      #puts "Searching for:#{search_item}"
      if item = @@items.detect { |i| i.name == search_item }
            resp.write "You requested item cost #{item.price}"
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
