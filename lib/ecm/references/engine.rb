module Ecm
  module References
    class Engine < Rails::Engine
      initializer :ecm_references_engine do
        ActiveAdmin.setup do |config|
          config.load_paths << File.join(self.root, 'app/admin')
        end
      end
    end
  end
end

