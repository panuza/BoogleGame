Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "boggle#boggle_view"
  get "/test-hello" => "test#test_hello"

  post "/api/user_details" => "api/user_details#create"
  get "/api/user_details/:user_uid" => "api/user_details#show"
  put "/api/user_details/calculate_total" => "api/user_details#calculate_total"
end
