# frozen_string_literal: true

module Api
  module V1
    class ProgramsController < Api::V1::ApiController
      before_action :auth_user

      def new
        @program = Program.new
      end

      def create
        program = Program.new(program_params)

        program.user_id = current_user.id unless program.user_id

        if program.save
          render jsonapi: program, include: [ :trainings, :user ], fields: { trainings: [:title, :id], user: [:username, :uid] }, status: 201
        else
          render jsonapi_errors: program.errors, status: 415
        end
      end

      def show; end

      def update
        current_user.update!(program_params)
        render :show
      end

      private

      def auth_user
        authorize :program
      end

      def program_params
        params.require(:program).permit(:title, :description, :user_id)
      end
    end
  end
end
