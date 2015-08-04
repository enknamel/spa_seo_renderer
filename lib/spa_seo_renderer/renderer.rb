module SpaSeoRenderer
  class Renderer

    def self.render(env)
      driver = Capybara::Webkit::Driver.new(nil, Capybara::Webkit::Configuration.to_hash)
      path = "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['REQUEST_PATH']}"
      driver.visit(path)
      [driver.status_code, {'Content-Type' => 'text/html'}, [driver.html]] # TODO status code not supported by selenium
    end

  end
end