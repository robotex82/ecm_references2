Rails.application.routes.draw do
  localized do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

    Ecm::References::Routing.routes(self)
  end
end
