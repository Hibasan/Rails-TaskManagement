Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks ,only: [:new,:create,:edit,:update,:destroy]
end


# root       GET /                             tasks#index
# tasks     POST /tasks(.:format)              tasks#create
# new_task   GET /tasks/new(.:format)          tasks#new
# edit_task  GET /tasks/:id/edit(.:format)     tasks#edit
#  task    PATCH /tasks/:id(.:format)          tasks#update
#            PUT /tasks/:id(.:format)          tasks#update
#         DELETE /tasks/:id(.:format)          tasks#destroy
