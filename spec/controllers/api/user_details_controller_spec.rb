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

  describe 'POST #create' do
    it 'should create' do
      expect(UserDetail.count).to eq 0
      post :create, params: { name: "Test name" }
      expect(UserDetail.count).to eq 1
      expect(UserDetail.last.name).to eq "Test name"
    end
  end

  describe 'PUT #calculate_total' do
    before do
      @user_detail = UserDetail.create!(name: "Foo Bar", user_uid: SecureRandom.hex(10).upcase )
    end

    it 'should calculate_total if valid word' do
      put :calculate_total, params: { useruid: @user_detail.user_uid, word: "test"}
      expect(UserDetail.last.score).to eq 4
    end
  end

  describe 'PUT #calculate_total' do
    before do
      @user_detail = UserDetail.create!(name: "Foo Bar", user_uid: SecureRandom.hex(10).upcase )
    end

    it 'should  show total as 0 for invalid word' do
      put :calculate_total, params: { useruid: @user_detail.user_uid, word: "aaaald"}
      expect(UserDetail.last.score).to eq 0
    end
  end
end
