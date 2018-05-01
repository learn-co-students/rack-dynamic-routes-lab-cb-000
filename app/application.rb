class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)


      #possibly something to do w/ params[]
      #code below works if there is no if condition
      item_name = req.path.split("/items/").last

      if @@items.include?(item_name)
        item = @@items.find{|i| i.name == item_name}
        resp.write item.price
      else
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
