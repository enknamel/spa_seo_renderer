module SpaSeoRenderer
  class Railtie < Rails::Railtie
    initializer "spa_seo_renderer.insert_middleware" do |app|
      app.config.middleware.use SpaSeoRenderer::Middleware
    end
  end
end
