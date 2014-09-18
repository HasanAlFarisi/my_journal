MyJournal::Application.routes.draw do
  devise_for :admins, :path => "admin",
    :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret' },
    :controllers => { :sessions => "admin/sessions" }
  
  root 'dashboard/home#index'

  namespace :admin do
    root to: "dashboard#index"

    resources :articles
    resources :categories
  end
end
