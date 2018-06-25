class Application

  @@items = []
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
      if !@@items.find{|i| i.name == item_name}
        resp.status = 400
        resp.write "Item not found"
      else resp.write item.price
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end


end
