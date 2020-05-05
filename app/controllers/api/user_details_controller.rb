class Api::UserDetailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include BoggleHelper

  def show
    @user_detail = UserDetail.find_by_user_uid(params[:user_uid])
  end

  def create
    @user_detail = UserDetail.new(name: params[:name],
                                  user_uid: SecureRandom.hex(10).upcase)
    @user_detail.save
    render 'show', status: 200
  end

  def calculate_total
    @user_detail = UserDetail.find_by_user_uid(params[:useruid])

    if valid_words.include? params[:word]
      word_length = params[:word].length
      @user_detail.update_attribute(:score, @user_detail.score + word_length)
    else
      total = 0
    end
  end

  def user_details_params
          params.require(:user_detail).permit(
            :name,
            :user_uid,
            :score
          )
        end
end
