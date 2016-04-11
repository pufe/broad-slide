Rails.application.routes.draw do
  root to: 'slide#show'
  post '/next' => 'slide#next'
  get '/edit' => 'slide#edit'
  post '/update' => 'slide#update'
end
