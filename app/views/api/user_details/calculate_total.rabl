object @user_detail
  
attributes :name, :user_uid, :score, :invalid

node(:invalid) do |user_detail|
  if user_detail.score == 0
    result = true
  else
    result = false
  end
  result
end
