Rails.application.routes.draw do
  namespace :api do
    resources :numbers
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '*path', to: 'application#cors_preflight_check', via: [:options]
end
