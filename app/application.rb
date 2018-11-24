class Application
@@items = []
def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)


if req.path.match(/items/)
  item_name = req.path.split("/items/").last
  if @@items.find{|x| x.name == item_name} == nil
    resp.write "Item not found"
    resp.status = 400
  else
  item = @@items.find{|x| x.name == item_name}
  resp.write item.price
end
else
resp.write "Route not found"
resp.status = 404
end #endif
resp.finish
end


end
