Rails.application.routes.draw do

	resources :comments, only: [:index, :create]
	get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment

  resources :users
  devise_for :authors
  devise_for :models
	root to: 'blog/posts#index'


	#espera que a URL possua /author/posts/new ou algo do tipo
	namespace :authors do
		resources :posts do
			put 'publish' => 'posts#publish', on: :member
			put 'unpublish' => 'posts#unpublish', on: :member
		end
	end

	#não espera que a URL possua nada específico, só recebe o comando e executa
	scope module: 'blog' do
		get 'sobre' => 'pages#sobre', as: :sobre
		get 'contato' => 'pages#contato', as: :contato
		get 'posts' => 'posts#index', as: :posts
		get 'posts/:id' => 'posts#show', as: :post
	end


	
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
