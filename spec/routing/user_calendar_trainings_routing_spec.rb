# == Schema Information
#
# Table name: user_calendar_trainings
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  training_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  icube_rule  :string
#  last_date   :datetime
#
# Indexes
#
#  index_user_calendar_trainings_on_training_id  (training_id)
#  index_user_calendar_trainings_on_user_id      (user_id)
#
require "rails_helper"

RSpec.describe UserCalendarTrainingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/user_calendar_trainings").to route_to("user_calendar_trainings#index")
    end

    it "routes to #show" do
      expect(get: "/user_calendar_trainings/1").to route_to("user_calendar_trainings#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/user_calendar_trainings").to route_to("user_calendar_trainings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/user_calendar_trainings/1").to route_to("user_calendar_trainings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/user_calendar_trainings/1").to route_to("user_calendar_trainings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/user_calendar_trainings/1").to route_to("user_calendar_trainings#destroy", id: "1")
    end
  end
end
