class Api::UserDetailsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @user_detail = User.find_by_user_uid(params[:user_uid])
  end

  def create
    @user_detail = UserDetail.new(name: params[:name],
                                  user_uid: SecureRandom.hex(10).upcase)
    @user_detail.save
    render 'show', status: 200
  end

  def calculate_total

  end

  def user_details_params
          params.require(:user_detail).permit(
            :name,
            :user_uid,
            :score
          )
        end
end
