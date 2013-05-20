Gottadoit::Application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  devise_scope :user do
    get "/signup" => "devise/registrations#new"
  end
  

  resources :tasks


  get "home/index"

  root to: 'home#index'
end
