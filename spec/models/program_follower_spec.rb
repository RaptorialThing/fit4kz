# == Schema Information
#
# Table name: program_followers
#
#  id          :bigint           not null, primary key
#  program_id  :bigint
#  user_id     :bigint
#  follow_date :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_program_followers_on_program_id  (program_id)
#  index_program_followers_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe ProgramFollower, type: :model do
  let(:program_follower) { FactoryBot.create(:program_follower) }

  it 'must have a user (author) and an program present' do
    expect(program_follower).to be_valid
  end

  it 'must have a user present' do
    program_follower = FactoryBot.build(:program_follower, user_id: nil)
    expect(program_follower).to_not be_valid
  end

  it 'must have a program present' do
    program_follower = FactoryBot.build(:program_follower, program_id: nil)
    expect(program_follower).to_not be_valid
  end
end
