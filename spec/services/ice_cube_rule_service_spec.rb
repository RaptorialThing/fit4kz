describe IceCubeRuleService do
  describe "set rule for user_calendar_training" do

    let(:user_calendar_training) { build(:user_calendar_training)}
    let(:ice_cube_rule_service) {IceCubeRuleService.new(user_calendar_training)}
    context "given user_calendar_training.ical = nil, every_day!" do

      it "returns everyday" do
        expect(ice_cube_rule_service.every_day!).to eq("Daily")
      end
    end

    context "given user_calendar_training.ical = nil, every_week_days! monday, tuesday, friday, sunday" do

      it "returns monday, tuesday friday, sunday" do
        expect(ice_cube_rule_service.every_week_days! "monday", "tuesday", "friday", "sunday").to eq("Weekly on Sundays, Mondays, Tuesdays, and Fridays")
      end
    end

    context "given user_calendar_training.ical = nil, friday! " do

      it "returns weekly on fridays" do
        expect(ice_cube_rule_service.friday!).to eq("Weekly on Fridays")
      end
    end

    context "given user_calendar_training.ical = nil, every_week_days! asdlkfajs" do

      it "returns error with asdlkfajs" do
        expect {ice_cube_rule_service.every_week_days! "asdlkfajs"}.to raise_error(ArgumentError)
      end
    end

  end
end
