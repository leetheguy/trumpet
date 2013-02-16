module Trumpet
  class Railtie < Rails::Railtie
    initializer 'trumpet.user_additions' do
      ActiveSupport.on_load :active_record do
        extend UserAdditions
      end
    end
  end
end
