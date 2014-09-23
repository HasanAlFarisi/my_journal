MyJournal::Application.routes.draw do

  devise_for :admins, :path => "admin",
    :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret' },
    :controllers => { :sessions => "admin/sessions" }
  
  root 'dashboard/home#index'
  
  namespace :dashboard do
  	resources :home do
        get :show_categories
        get :show_sub_categories
      end
      resources :comments
  end

  namespace :admin do
    root to: "profiles#index"
    resources :profiles

    resources :articles do
      collection do
        post :destroy_all
        post :auto_search
      end
    end

    resources :categories do
      collection do
        post :destroy_all
      end
    end
  end
end
