class WelcomeController < ApplicationController
  skip_after_action :verify_authorized, only: :index
  skip_after_action :verify_policy_scoped, only: :index

  def index
    skip_authorization
    render "welcome/index"
  end
end
