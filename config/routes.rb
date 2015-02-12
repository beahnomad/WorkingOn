Rails.application.routes.draw do
  root to: 'works#index'
  resource :work
end
