class Application
  @@items = ["This","That"]
   def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    path = req.path
    if (/items/ =~ path)
      item_search = path.split("/items/").last
      matched_item = @@items.select{|item|item.name==item_search}
      if matched_item.length > 0
        resp.write matched_item[0].price
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
