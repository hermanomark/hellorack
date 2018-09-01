class ToCapitalize
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    capitalize_body = body.map { |chunk| chunk.capitalize }

    [status, headers, capitalize_body]
  end
end

class TimeStamp
  def initialize(app)
    @app = app
  end 

  def call(env)
    status, headers, body = @app.call(env)
    time = "<h1> #{Time.now} </h1>"
    time_stamp_body = body.push(time)

    [status, headers, time_stamp_body]
  end
end

class Hello
  def call (env)
    status = 200 #any http status like 301, 404
    headers = { "Content-Type" => "text/html" } #it tells to load as an html
    body = ["time right now: <br>", 'hahah!'] #contains the body of the webpage

    [status, headers, body]
  end
end

use TimeStamp
use ToCapitalize
run Hello.new