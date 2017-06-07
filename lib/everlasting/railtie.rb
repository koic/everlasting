# -*- frozen-string-literal: true -*-

module Everlasting
  class Railtie < ::Rails::Railtie
    initializer 'everlasting.initialize' do
      ActiveSupport.on_load(:action_controller) do
        Everlasting::Hooks.init
      end
    end
  end
end
