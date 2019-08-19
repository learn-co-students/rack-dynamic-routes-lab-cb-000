class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
      if req.path.match(/items/)
        item_requested = req.path.split("/items/").last
        item = @@items.find{|i| i.name == item_requested}
        if !item.nil?
          resp.write item.price
          resp.status = 200
        elsif item.nil?
          resp.write "Item not found"
          resp.status = 400
        end
      else
        resp.write "Route not found."
        resp.status = 404
      end
    resp.finish
  end

end
