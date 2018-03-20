class Application
  def call(env)
      resp = Rack::Response.new
      # resp.write "Hello, World!"

      # https://github.com/bcuz/rack-get-params-lab-cb-000/blob/master/app/application.rb
      resp.finish
    end
end
