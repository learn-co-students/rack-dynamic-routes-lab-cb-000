class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_title = req.path.split("/items/").last
      if Item.all.collect(&:name).include? item_title
        resp.write "#{Item.find_by_name(item_title).price}"
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
