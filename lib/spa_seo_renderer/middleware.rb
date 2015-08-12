module SpaSeoRenderer
  class NotSeoFriendly < Exception
  end

  class Middleware
    class << self
      attr_accessor :base_path
    end

    def initialize(app)
      @app = app
    end

    def call(env)
      if will_render?(env)
        SpaSeoRenderer::Renderer.render(env)
      else
        @app.call(env)
      end
    end

    private

    def will_render?(env)
      is_bot?(env) && is_renderable?(env)
    end

    def is_bot?(env)
      [
          "Googlebot",
          "Googlebot-Mobile",
          "AdsBot-Google",
          "Mozilla/5.0 (compatible; Ask Jeeves/Teoma; +http://about.ask.com/en/docs/about/webmasters.shtml)",
          "Baiduspider",
          "Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)",
          "Google"
      ].detect { |ua| env["HTTP_USER_AGENT"].index ua }
    end

    def is_renderable?(env)
      path = env["PATH_INFO"]
      content_type = path.index(".") && path.split(".").last

      path.start_with?(self.class.base_path) & [nil, "htm", "html"].include?(content_type) && env["REQUEST_METHOD"] == "GET"
    end
  end
end
