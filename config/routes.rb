Rails.application.routes.draw do
  root to: 'users#new'
  namespace :admin do
    resources :users
  end
  resources :users ,only: [:new,:create,:show,:edit,:update]
  resources :sessions ,only: [:new,:create,:destroy]
  resources :tasks ,only: [:index,:new,:create,:show,:edit,:update,:destroy]
end


# root GET    /                                                                                        tasks#index
#                     tasks GET    /tasks(.:format)                                                                         tasks#index
#                           POST   /tasks(.:format)                                                                         tasks#create
#                  new_task GET    /tasks/new(.:format)                                                                     tasks#new
#                 edit_task GET    /tasks/:id/edit(.:format)                                                                tasks#edit
#                      task GET    /tasks/:id(.:format)                                                                     tasks#show
#                           PATCH  /tasks/:id(.:format)                                                                     tasks#update
#                           PUT    /tasks/:id(.:format)                                                                     tasks#update
#                           DELETE /tasks/:id(.:format)                                                                     tasks#destroy


# admin_users GET    /admin/users(.:format)                                                                   admin/users#index
#             POST   /admin/users(.:format)                                                                   admin/users#create
# new_admin_user GET    /admin/users/new(.:format)                                                               admin/users#new
# edit_admin_user GET    /admin/users/:id/edit(.:format)                                                          admin/users#edit
#  admin_user GET    /admin/users/:id(.:format)                                                               admin/users#show
#             PATCH  /admin/users/:id(.:format)                                                               admin/users#update
#             PUT    /admin/users/:id(.:format)                                                               admin/users#update
#             DELETE /admin/users/:id(.:format)                                                               admin/users#destroy
