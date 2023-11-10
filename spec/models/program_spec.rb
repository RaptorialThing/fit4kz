# == Schema Information
#
# Table name: programs
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_programs_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Program, type: :model do
  let(:program) { FactoryBot.create(:program) }

  it 'must have title, description present' do
    expect(program).to be_valid
  end

  it 'must have a title present' do
    program = FactoryBot.build(:program, title: nil)
    expect(program).to_not be_valid
  end

  it 'must have a description present' do
    program = FactoryBot.build(:program, description: nil)
    expect(program).to_not be_valid
  end

  it 'could have many followers' do
    program = Program.reflect_on_association(:program_followers)
    expect(program.macro).to eq(:has_many)
  end
end
