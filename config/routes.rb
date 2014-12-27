MyJournal::Application.routes.draw do
  devise_for :admins, :path => "admin",
    :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret' },
    :controllers => { :sessions => "admin/sessions",
                                 :registrations => "admin/registrations",
                                 #:omniauth_callbacks => "admin/omniauth_callbacks"
                              }

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
      resources :profiles, only: [:show] do
         get :show_admin
      end
      resources :galleries do
          get :show_photo
          post :comment
      end
  end

  namespace :admin do
    
    root to: "company_profiles#index"

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

    resources :advertises do
      collection do
         get :edit_lock
         post :edit_lock_open
       end
    end

    resources :complete_profiles
    resources :profiles
    resources :helps
    resources :gallery_groups

    resources :galleries do
        collection do
            post :create_reply
        end
    end

    resources :journals do
        collection do
            post :selected_members
            post :selected_checks
            get :project_search
            get :add_row_designers
            get :add_row_developers
            get :add_row_checks
            delete :destroy_add_rows 
        end
    end
    
    resources :journal_issues do
        get :list_data_by_status
        collection do
            get :add_row_watchers
            get :show_task_image
            get :show_task_image
            delete :destroy_add_rows 
        end
    end

    resources :journal_issue_comment, only: [:create, :show, :destroy]

    resources :company_profiles
    
    resources :contacts, only: [:create, :show, :destroy] do
      post :create_notification_for_all_admins
      post :create_reply_contact
      delete :destroy_reply
    end

    resources :messages do
      collection do
        post :create_reply_contact_for_admin
      end
      delete :destroy_reply
    end
  end
end
