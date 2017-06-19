class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
 
      item_name = req.path.split("/items/").last #turn /items/Sorry into Sorry
      
      item = @@items.find{|s| s.name == item_name}
      
        if item == nil
            #error
            resp.write "Item not found"
            resp.status = 400
        else
            resp.write item.price
        end
        
    else
        #error 
        resp.write "Route not found"
        resp.status = 404
    end
 
    resp.finish
  end
end