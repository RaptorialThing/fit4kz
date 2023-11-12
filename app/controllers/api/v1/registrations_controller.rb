# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController

      include Api::Concerns::ActAsApiRequest
      protect_from_forgery with: :exception, unless: :json_request?

      def new
        @user = User.new
        @minimum_password_length = 8
      end

      def create
        return render(json: { error: I18n.t('api.errors.already_email_exists') }, status: 409) if User.find_by( email: params[:email])

        user = User.new(sign_up_params)

        if user.save
          render json: user, status: 201
        else
          render json: user.errors.full_messages, status: 401
        end
      end

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation,
                                     :username, :first_name, :last_name)
      end

      def render_create_success
        render :create
      end
    end
  end
end
