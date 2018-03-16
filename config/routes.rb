# == Route Map
#
# Prefix Verb URI Pattern                        Controller#Action
#  login GET  /login(.:format)                   login#index
#        GET  /auth/:provider/callback(.:format) sessions#index
#   root GET  /                                  login#index
# 

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ## Deal with login to redirect
  get 'login', to: 'login#index'
  ## Deal with session creating
  get '/auth/:provider/callback', to: 'sessions#create'
  root 'profile#index'
end
