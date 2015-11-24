Rails.application.routes.draw do
  localized do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end
end
