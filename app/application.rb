class Application

  @@item =[]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      #resp.write "something"

      item_price = req.path.split("/items/").last
      # item = @@item.find {|i| i.price == item_price}

      resp.write item_price

    #  if

    #  else

    #  end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
