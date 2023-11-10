# == Schema Information
#
# Table name: trainings
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  program_id  :bigint
#  video_link  :string
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_trainings_on_program_id  (program_id)
#  index_trainings_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe Training, type: :model do
  let(:training) { FactoryBot.create(:training) }

  it 'must have title, description present' do
    expect(training).to be_valid
  end

  it 'must have a title present' do
    training = FactoryBot.build(:training, title: nil)
    expect(training).to_not be_valid
  end

  it 'must have a description present' do
    training = FactoryBot.build(:training, description: nil)
    expect(training).to_not be_valid
  end

  it 'could have many followers' do
    training = Program.reflect_on_association(:program_followers)
    expect(training.macro).to eq(:has_many)
  end

end
