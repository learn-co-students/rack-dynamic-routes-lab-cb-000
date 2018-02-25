class Application
  # Your application should only accept the /items/<ITEM NAME> route. Everything else should 404
  # If a user requests /items/<Item Name> it should return the price of that item
  # If a user requests an item that you don't have, then return a 400 and an error message

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # proceed if path is /items/
    if req.path.match(/items/)
    # 404 if path is NOT /items/  
    else
      resp.status=404
      resp.write "Route not found"
    end

    resp.finish
  end
end
