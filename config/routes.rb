Rails.application.routes.draw do
  devise_for :users
  
  resources :students do
    get :subjects
  end
  resources :teachers do
  	get :subjects
  end
  #resources :report_subjects
  #  get :subjects
  get 'report_subjects', controller: 'reports', action: 'subjects' #get 'report_subjects' => 'reports#subjects'
  
  #root 'students#index'
  root 'visitors#index'

  get 'visitors' => 'visitors#index'

end
