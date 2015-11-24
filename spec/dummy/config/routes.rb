Rails.application.routes.draw do
  localized do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

    Ecm::References::Routing.routes(self)

    root to: 'ecm/references/categories#index'
  end
end
