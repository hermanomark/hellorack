class ToUpper
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    upcased_body = body.map { |chunk| chunk.upcase }

    [status, headers, upcased_body]
  end
end

class Hello
  def call (env)
    status = 200 #any http status like 301, 404
    headers = { "Content-Type" => "text/html" } #it tells to load as an html
    body = ["Yay, your first rack application! <3"] #contains the body of the webpage

    [status, headers, body]
  end
end

use ToUpper
run Hello.new