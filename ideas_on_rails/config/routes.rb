Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :ideas do
    resources :reviews, only: [:create, :destroy], shallow: true
  end

  # Idea#new
  # get('/ideas/new', to: 'ideas#new', as: :new_idea)
  # # Idea#create
  # post('/ideas', to: 'ideas#create', as: :ideas)
  # # Idea#index
  get('/', to: 'ideas#index')
  # get('/ideas', to: 'ideas#index')
  # # Idea#show
  # get('/ideas/:id', to: 'ideas#show', as: :idea)
  # # Idea#edit
  # get('/ideas/:id/edit', to: 'ideas#edit', as: :edit_idea)
  # # Idea#update
  # patch('/ideas/:id', to: 'ideas#update')
  # put('/ideas/:id', to: 'ideas#update')
  # # Idea#destroy
  # delete('/ideas/:id', to: 'ideas#destroy', as: :delete_idea)
end
