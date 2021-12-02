Rails.application.routes.draw do
  resources :links, except: :show
  get '/:code', to: 'links#show'
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
