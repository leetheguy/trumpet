module Trumpet
  class Railtie < Rails::Railtie
    initializer 'trumpet.trumpet' do
      ActiveSupport.on_load :active_record do
        extend Trumpet
      end
    end
  end
end
