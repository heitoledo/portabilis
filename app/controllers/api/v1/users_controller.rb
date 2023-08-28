module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.new(user_params)

        if user.save!
          render json: 'Created Successfully!', status: 201
        else
          errors = []
          user.errors.each { |error| errors << error.full_message }
          render json: { errors: errors }, status: 422
        end
      end

      def deactivate
        user = User.find(params[:user_id])

        if user.active?
          user.toggle!(:active)
          render json: 'User successfully deactivated!', status: 200
        else
          render json: { error: 'User already deactivated!' }, status: 422
        end
      end

      private
      def user_params
        params.require(:user).permit!
      end
    end
  end
end
