WebHooksPlayground::Application.routes.draw do
  resources :call_backs

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  match ':username/:repository/notify' => 'call_backs#notify'
  root :to => 'call_backs#index'
end
