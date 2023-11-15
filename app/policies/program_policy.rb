# frozen_string_literal: true

class ProgramPolicy < ApplicationPolicy

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
    user.id == program.user.id
  end

  def destroy?
    update?
  end
end
