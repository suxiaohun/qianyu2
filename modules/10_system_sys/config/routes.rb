Rails.application.routes.draw do

  scope module: :sys do
    # code designer spec
    get '/colors'=>'visitors#render'
    get '/guides'=>'visitors#guides'

    match 'colors',to: 'visitors#color',via:[:get]


    match 'login', to: 'login#login', via: [:get, :post]
    match 'logout', to: 'login#logout', via: :all


    get 'personal_info' => 'users#personal_info'

    resources :users
  end



  # root路由，一般指向主页
  root 'sys/users#personal_info'


end