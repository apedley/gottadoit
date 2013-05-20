Gottadoit::Application.routes.draw do

  resources :tasks do
    collection do
      get 'incomplete', :as => 'incomplete'
    end
  end


  get "home/index"

  root to: 'home#index'
end
