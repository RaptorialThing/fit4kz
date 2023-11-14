# frozen_string_literal: true

class TrainingPolicy < ApplicationPolicy

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
