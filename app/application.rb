class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name_in_path = req.path.split("/items/").last
      
      searched_item = @@items.find { |item| item.name == item_name_in_path }
      
      if searched_item 
        resp.write searched_item.price
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