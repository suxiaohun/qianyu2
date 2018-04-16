Rails.application.routes.draw do

  scope module: :sys do

    #====================================================================#
    # code designer spec
    get '/colors'=>'visitors#color'
    get '/guides'=>'visitors#guides'
    get '/layouts_and_rendering'=>'visitors#layouts_and_rendering'
    get '/helper_doc'=>'visitors#helper_doc'
    get '/css3_doc'=>'visitors#css3_doc'
    get '/jquery_select'=>'visitors#jquery_select'

    #====================================================================#



    match 'colors',to: 'visitors#color',via:[:get]


    match 'login', to: 'login#login', via: [:get, :post]
    match 'logout', to: 'login#logout', via: :all


    get 'personal_info' => 'users#personal_info'

    resources :users
  end



  # root路由，一般指向主页
  root 'sys/users#personal_info'


end