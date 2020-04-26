Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "boogle#boogle_board"
  get "/test-hello" => "test#test_hello"
end
