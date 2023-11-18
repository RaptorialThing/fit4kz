module Api
  module V1
    class UserCalendarTrainingsController < Api::V1::ApiController
      before_action :auth_user

      #before_action :set_user_calendar_training, only: %i[ show update destroy ]

      # GET /user_calendar_trainings
      # GET /user_calendar_trainings.json
      def index
         @user_calendar_trainings = policy_scope(UserCalendarTraining)
         render jsonapi: @user_calendar_trainings, include: [:training, :user], fields: { training: [:title, :id], user: [:username, :uid] }
      end

      # GET /user_calendar_trainings/1
      # GET /user_calendar_trainings/1.json
      def show
        @user_calendar_training = UserCalendarTraining.includes([:training, :user]).find_by(id: params[:id])
        render jsonapi_errors: { detail: "record not found"}, status: 404 unless @user_calendar_training
      end

      # POST /user_calendar_trainings
      # POST /user_calendar_trainings.json
      def create
        @user_calendar_training = UserCalendarTraining.new(user_calendar_training_params)

        if @user_calendar_training.save
          render jsonapi:  @user_calendar_training, include: [ :training, :user ], fields: { training: [:title, :id], user: [:username, :uid] }, status: :created
          else
          render jsonapi_errors:  @user_calendar_training.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /user_calendar_trainings/1
      # PATCH/PUT /user_calendar_trainings/1.json
      def update
        if @user_calendar_training.update(user_calendar_training_params)
          render :show, status: :ok, location: @user_calendar_training
        else
          render jsonapi_error: @user_calendar_training.errors, status: :unprocessable_entity
        end
      end

      # DELETE /user_calendar_trainings/1
      # DELETE /user_calendar_trainings/1.json
      def destroy
        @user_calendar_training.destroy
      end

      private

        def auth_user
          authorize :user_calendar_training
        end
        # Use callbacks to share common setup or constraints between actions.
        def set_user_calendar_training
          @user_calendar_training = UserCalendarTraining.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def user_calendar_training_params
          params.require(:user_calendar_training).permit(:user_id, :training_id, :icube_rule, :last_date)
        end
    end
  end
end
