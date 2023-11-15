# frozen_string_literal: true

class TrainingPolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :program)
    def resolve
      if AdminUser.exists? user.id
        Training.includes([:programs, :user])
      else
        User.includes(trainings: [:program]).find(user.id).trainings
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
    user.id == training.id
  end

  def destroy?
    update?
  end
end
