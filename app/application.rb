class Application

    @@items = [Item.new("Soap", "3.99"), Item.new("Towel", "4.98"), Item.new("Razor", "8.99")]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
          item_name = req.path.split("/items/").last #turn /items/item into item
           if item = @@items.find{|i| i.name == item_name}
            resp.write item.price
        
            else
             resp.status = 400
             resp.write  "Item not found"
            end

        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish    
    end
end