# frozen_string_literal: true

module Api
  module V1
    class TrainingsController < Api::V1::ApiController
      before_action :auth_user

      def show; end

      def update
        current_user.update!(user_params)
        render :show
      end

      private

      def auth_user
        authorize current_user
      end

      def training_params
        params.require(:traing).permit(:title, :description, :program_id, :user_id)
      end
    end
  end
end
