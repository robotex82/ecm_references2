module Ecm
  module References
    class Engine < Rails::Engine
      initializer :ecm_references_engine do
        ActiveAdmin.setup do |config|
          config.load_paths << File.join(root, 'app/admin')
        end
      end if Gem::Specification.find_all_by_name('activeadmin').any?
    end
  end
end
