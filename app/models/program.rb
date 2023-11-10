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
class Program < ApplicationRecord
  has_many :trainings
  has_many :program_followers
  has_many :users, through: :program_followers
  belongs_to :user
  alias_attribute :author, :user

  validates_presence_of :title, :description
end
