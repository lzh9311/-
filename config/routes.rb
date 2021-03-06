Rails.application.routes.draw do

    root "static_pages#home"
    #具名路由，更方便调用与修改
    get "/help",      to:"static_pages#help"
    get "/about",     to:"static_pages#about"
    get "/contact",   to:"static_pages#contact"
    get "/signup",    to:"users#new"
    get "/login",     to:"sessions#new"
    post "/login",    to:"sessions#create"
    delete "/logout", to:"sessions#destroy"
    resources :users do
        member do
            get :following, :followers
        end
    end
    resources :relationships, only: [:create, :destroy]
    resources :microposts, only: [:create, :destroy,:show]
end
