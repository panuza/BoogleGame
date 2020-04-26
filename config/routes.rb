Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "boggle#boggle_view"
  get "/test-hello" => "test#test_hello"
end
