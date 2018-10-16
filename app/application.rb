class Application

  def call(env)
    resp = Rack::Response.new(env)
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split('/items/').last

      if @@items.any? {|items| items.name == item}
        prod = @@items.find{|items| items.name == item}

        resp.write prod.price.to_s
      else
        return [400, {"Content-Type" => "text/html"}, "Item not found"]
      end

    else
      return [404, {"Content-Type" => "text/html"}, "Route not found"]
    end
    resp.finish
  end
end
