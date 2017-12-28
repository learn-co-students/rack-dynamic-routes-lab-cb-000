class Application
  @@items = []

  def call(env)
    rrs = Rack::Response.new
    rrq = Rack::Request.new(env)
    if rrq.path.match(/items/)
      item_name = rrq.path.split("/items/").last
      item = @@items.find {|i| i.name == item_name}
      if item != nil
        rrs.write item.price
      else
        rrs.write "Item not found"
        rrs.status = 400
      end
    else
       rrs.status = 404
       rrs.write "Route not found"
    end
    rrs.finish
  end
end
