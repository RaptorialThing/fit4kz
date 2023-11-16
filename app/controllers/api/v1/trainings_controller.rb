# frozen_string_literal: true

module Api
  module V1
    class TrainingsController < Api::V1::ApiController
      before_action :auth_user

      def index
        trainings = policy_scope(Training)
        render jsonapi: trainings, include: [:program, :user], fields: { program: [:title, :id], user: [:username, :uid] }
      end

      def new
        @training = Training.new
      end

      def create
        training = Training.new(training_params)

        training.user_id = current_user.id unless training.user_id

        if training.save
          render jsonapi: training, include: [ :program, :user ], fields: { program: [:title, :id], user: [:username, :uid] }, status: 201
          #render jsonapi: training, include: [ user: [:username], program: [:title, trainings: [:title]]], status: 201
        else
          render jsonapi_errors: training.errors, status: 415
        end
      end

      def show
        @training = Training.includes([:program, :user]).find_by(id: params[:id])
        render jsonapi_errors: { detail: "record not found"}, status: 404 unless @training
      end

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
