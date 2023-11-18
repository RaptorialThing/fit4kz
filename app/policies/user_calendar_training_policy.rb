# frozen_string_literal: true

class UserCalendarTrainingPolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :training)
    def resolve
      if AdminUser.exists? user.id
        UserCalendarTraining.includes([:training, :user])
      else
        UserCalendarTraining.includes([:training, :user]).where(user_id: user.id)
      end
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    user.id == user_calendar_training.user.id
  end

  def destroy?
    update?
  end
end
