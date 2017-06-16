class Application

  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      submitted_string = req.path.split("/items/").last
      selected_item = @@items.select{|item| item.name == submitted_string}
      if selected_item.empty?
        resp.write "Item not found: #{submitted_string}"
        resp.status = 400
      else
        resp.write("Price of #{selected_item[0].name} is $#{selected_item[0].price}")
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
