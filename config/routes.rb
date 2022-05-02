Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :user
  # resources :producto
  # resources :supplier

  post '/auth/login', to: 'authentication#login'
  
  # Users request
  get '/apiv1/users', to: 'user#index'
  post '/apiv1/user/update', to: 'user#update'
  post '/apiv1/user/create', to: 'user#create'
  post '/apiv1/user/delete', to: 'user#destroy'

  # product request
  get '/apiv1/products', to: 'producto#index'
  post '/apiv1/product/update', to: 'producto#update'
  post '/apiv1/product/create', to: 'producto#create'
  post '/apiv1/product/delete', to: 'producto#destroy'

  # suppliers request
  get '/apiv1/suppliers', to: 'supplier#index'
  post '/apiv1/supplier/update', to: 'supplier#update'
  post '/apiv1/supplier/create', to: 'supplier#create'
  post '/apiv1/supplier/delete', to: 'supplier#destroy'

  # clients request
  get '/apiv1/clients', to: 'client#index'
  post '/apiv1/client/update', to: 'client#update'
  post '/apiv1/client/create', to: 'client#create'
  post '/apiv1/client/delete', to: 'client#destroy'

    # carshop request
  get '/apiv1/carshop', to: 'car_shop#index'
  post '/apiv1/carshop/update', to: 'car_shop#update'
  post '/apiv1/carshop/create', to: 'car_shop#create'
  post '/apiv1/carshop/delete', to: 'car_shop#destroy'

  # carshop request
  get '/apiv1/clientSupplier', to: 'client_supplier#index'
  post '/apiv1/clientSupplier/update', to: 'client_supplier#update'
  post '/apiv1/clientSupplier/create', to: 'client_supplier#create'
  post '/apiv1/clientSupplier/delete', to: 'client_supplier#destroy'

  # gallery request
  get '/apiv1/gallery', to: 'gallery#index'
  post '/apiv1/gallery/update', to: 'gallery#update'
  post '/apiv1/gallery/create', to: 'gallery#create'
  post '/apiv1/gallery/delete', to: 'gallery#destroy'

  # orderProduct request
  get '/apiv1/orderProduct', to: 'order_product#index'
  post '/apiv1/orderProduct/update', to: 'order_product#update'
  post '/apiv1/orderProduct/create', to: 'order_product#create'
  post '/apiv1/orderProduct/delete', to: 'order_product#destroy'

  # order request
  get '/apiv1/order', to: 'order#index'
  post '/apiv1/order/update', to: 'order#update'
  post '/apiv1/order/create', to: 'order#create'
  post '/apiv1/order/delete', to: 'order#destroy'

  # sale request
  get '/apiv1/sale', to: 'sale#index'
  post '/apiv1/sale/update', to: 'sale#update'
  post '/apiv1/sale/create', to: 'sale#create'
  post '/apiv1/sale/delete', to: 'sale#destroy'

   # saleProduct request
   get '/apiv1/saleProduct', to: 'sale_product#index'
   post '/apiv1/saleProduct/update', to: 'sale_product#update'
   post '/apiv1/saleProduct/create', to: 'sale_product#create'
   post '/apiv1/saleProduct/delete', to: 'sale_product#destroy'

end
