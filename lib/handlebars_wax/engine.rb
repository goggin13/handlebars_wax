module HandlebarsWax
  class Engine < Rails::Engine
    config.to_prepare do
      HandlebarsConfig.register_partials
    end
  end
end
