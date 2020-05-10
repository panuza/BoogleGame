require 'rails_helper'

describe Api::UserDetailsController, type: :controller do
  render_views

  describe 'GET #dashboard' do
    before do
      @user_detail = UserDetail.create!(name: "Foo Bar", user_uid: SecureRandom.hex(10).upcase )
    end
    
    it 'will GET #show' do
      get :show, params: { user_uid: @user_detail.user_uid }
      expect(response.content_type).to eq('application/json')
      expect(response).to be_successful
    end
  end
end
