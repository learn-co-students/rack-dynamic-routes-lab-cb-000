class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new

    if req.path == "/items"
      resp.write "Got eem"
      resp.status = 200
    else
      resp.write "404: Page not Found."
      resp.status = 404
    end

    resp.finish
  end
end
