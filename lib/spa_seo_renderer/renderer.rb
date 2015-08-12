module SpaSeoRenderer
  class Renderer

    def self.render(env)
      driver = Capybara::Webkit::Driver.new(nil, Capybara::Webkit::Configuration.to_hash)
      driver.header('User-Agent', 'capybara')
      path = "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['REQUEST_PATH']}"
      driver.visit(path)
      [driver.status_code, driver.response_headers.reject { |k, _| k == 'Transfer-Encoding' }, [driver.html]] # TODO correcting headers
    end

  end
end