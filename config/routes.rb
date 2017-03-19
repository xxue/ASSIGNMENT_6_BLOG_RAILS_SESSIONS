Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get '/about'    => 'home#about', as: :about
  get '/contact'  => 'home#contact', as: :contact

  patch 'change_pw'  => 'users#change_password', as: :pw
  # patch 'change_pw'  => 'users#change_password', as: :pw

   get 'posts/liked_post' => 'posts#liked_post', as: :liked_post

  resources :posts do

    resources :likes, only: [:create, :destroy], shallow: true
    resources :comments
  end

  resources :sessions, only: [:new, :create, :edit] do
    delete :destroy, on: :collection
  end
      # resources :users, only: [:new, :create]

  resources :users
end


  # patch '/posts/:post_id/comments' => 'comments#more_comments'
