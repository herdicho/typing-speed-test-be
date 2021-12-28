Rails.application.routes.draw do
  resources :high_word_scores
  resources :high_wpm_scores do
    collection do
      get 'search'
    end
  end
  resources :words
  resources :timers
  resources :languages
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
