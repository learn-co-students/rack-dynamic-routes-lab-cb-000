
class Application

  @@items = []

  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

    if request.path.match(/items/)
      item = request.path.split("/items/").last
      it = @@items.find{|i| i.name == item}
      if @@items.include?(it)
        response.write "#{it.price}"
        response.status = 200
      else
        response.write "Item not found"
        response.status = 400
      end
    else
      response.write "Route not found"
      response.status = 404
    end
    response.finish
  end
end
