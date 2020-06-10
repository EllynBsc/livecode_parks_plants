






Rails.application.routes.draw do
  resources :gardens do
    #all the routes inside will have the garden_id in the url
    resources :plants, only: [:new, :create] #shallow nesting, you only nest the essential
  end

  resources :plants, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
