require 'headless'
require 'capybara-webkit'

module SpaSeoRenderer
  class Renderer

    def self.render(env)
      Headless.ly do
        driver = Capybara::Webkit::Driver.new(nil, Capybara::Webkit::Configuration.to_hash)
        driver.header('User-Agent', 'capybara')
        path = "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['REQUEST_PATH']}"
        driver.visit(path)
        [driver.status_code, driver.response_headers.reject { |k, _| ['content-encoding', 'transfer-encoding'].include?(k.downcase) }, [driver.html]] # TODO correcting headers
      end
    end

  end
end