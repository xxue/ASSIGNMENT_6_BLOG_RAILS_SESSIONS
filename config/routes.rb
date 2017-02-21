Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  get '/about'    => 'home#about', as: :about_path
  get '/contact'  => 'home#contact', as: :contact_path
  get '/signup'   => 'home#signup', as: :signup_path
  get '/login'    => 'home#login', as: :login_path


  resources :posts do
    resources :likes, only: [:create, :destroy], shallow: true
    resources :comments
  end

  # patch '/posts/:post_id/comments' => 'comments#more_comments'

end
