module Middleware
  class BadRequestThingy
    def initialize(app)
      @app = app
    end

    def call(env)
        call_with_rescue(env)
    end

    private

    def call_with_rescue(env)
      @app.call(env)
    rescue ActionController::BadRequest => e
      puts "BAD REQUEST RESCUED"
      [ 400, {}, [ "" ] ]
    end
  end
end
