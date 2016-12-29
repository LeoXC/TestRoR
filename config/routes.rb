Rails.application.routes.draw do
  resources :students do
    get :subjects
	root :to => 'visitors#index'
  end
end
