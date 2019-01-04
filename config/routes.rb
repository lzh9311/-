Rails.application.routes.draw do
  get 'users/new'

    root "static_pages#home"
    #具名路由，更方便调用与修改
    get "/help", to:"static_pages#help"
    get "/about", to:"static_pages#about"
    get "/contact", to:"static_pages#contact"
    get "/signup", to:"users#new"
end
