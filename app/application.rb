class Application
  @@items = []

  def call(env)
    request = Rack::Request.new env
    response = Rack::Response.new

    category, item_name = request.path.scan(/\w+/)

    if category == "items"
      item = @@items&.detect { |item| item.name == item_name }
      
      if item
        [200, {"content-type" => "text/html"}, item.price.to_s]
      else
        [400, {"content-type" => "text/html"}, "Item not found"]
      end
    else
      [404, {"content-type" => "text/html"}, "Route not found"]
    end
  end
end
