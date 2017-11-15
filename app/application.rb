class Application

    @@items = [Item.new("test_zero", 1200), Item.new("test_one", 950)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            input_item = req.path.split("/items/").last

            check_for_item = @@items.select {|item| item.name == input_item}

            if !check_for_item.empty?
                resp.write check_for_item[0].price
            else
                resp.write "Item not found"
                resp.status = 400
            end

        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end