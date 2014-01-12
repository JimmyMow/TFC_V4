TFCV4::Application.routes.draw do
  # Root
  root to: "posts#index"
  # Posts
  resources :posts do
    member { post :upvote }
    member { post :downvote }
  end
  # Users
  devise_for :user, controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  get '/users/:id' => 'users#show', as: 'user'
  #Comment
  resources :comments do
    member { post :upvote }
    member { post :downvote }
  end
end
