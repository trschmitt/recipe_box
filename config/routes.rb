Rails.application.routes.draw do
  get 'steps/new'

  get 'steps/edit'

  get 'steps/index'

  get 'steps/show'

  root to: 'recipes#index'

  resources :recipes do
    resources :ingredients
    resources :steps 
  end

end
