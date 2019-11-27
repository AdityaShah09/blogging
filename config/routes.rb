# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'homes#index'
  # Below for all other routes:
  devise_for :users
  resources :users do
    resources :posts do
      put 'like', to: 'posts#upvote'
      put 'dislike', to: 'posts#downvote'
      resources :comments do
        put 'like', to: 'comments#upvote'
        put 'dislike', to: 'comments#downvote'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
