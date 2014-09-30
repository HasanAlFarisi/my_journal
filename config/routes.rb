MyJournal::Application.routes.draw do

  devise_for :admins, :path => "admin",
    :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret' },
    :controllers => { :sessions => "admin/sessions" }
  
  root 'dashboard/home#index'
  
  namespace :dashboard do
  	resources :home do
        get :show_categories
        get :show_sub_categories
        get :search_articles
      end
      resources :comments do
        post :create_reply_comment
        delete :destroy_reply
      end
      resources :profiles, only: [:show]
  end

  namespace :admin do
    if Admin::Profile.last != nil
      root to: "profiles#index"
    else
      root to: "profiles#new"
    end
    resources :profiles

    resources :articles do
      collection do
        get :article_search
        post :destroy_all
        post :auto_search
        post :auto_search_sidebar
      end
    end

    resources :categories do
      collection do
        post :destroy_all
      end
    end

    resources :contacts, only: [:create]
  end
end
