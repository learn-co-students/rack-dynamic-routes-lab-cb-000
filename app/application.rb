class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            search_item = req.path.split("/items/").last
            resp.write handle_request(search_item)[0]
            resp.status = handle_request(search_item)[1]
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end

    def handle_request(search_item)
        item = @@items.select{|item| item.name == search_item}
        if item.any?
            return ["#{item[0].price}", 200]
        else
            return ["Item not found", 400]
        end
    end
end
