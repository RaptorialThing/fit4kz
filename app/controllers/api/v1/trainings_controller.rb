# frozen_string_literal: true

module Api
  module V1
    class TrainingsController < Api::V1::ApiController
      before_action :auth_user

      def new
        @training = Training.new
      end

      def create
        training = Training.new(training_params)

        training.user_id = current_user.id unless training.user_id

        if training.save
          render json: training, status: 201 #jsonapi
        else
          render json: training.errors.full_messages, status: 415
        end
      end

      def show; end

      def update
        current_user.update!(training_params)
        render :show
      end

      private

      def auth_user
        authorize :training
      end

      def training_params
        params.require(:training).permit(:title, :description, :program_id, :user_id,:video_link)
      end
    end
  end
end
