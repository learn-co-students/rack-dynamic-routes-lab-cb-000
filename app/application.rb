class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("/items/")
      item_name = req.path.split("/items/").last
      if @@items.find { |an_item| an_item.name == item_name }
        price = @@items.find { |an_item| an_item.name == item_name }.price
        resp.status = 200
        resp.write "The price of the #{item_name} is #{price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end
