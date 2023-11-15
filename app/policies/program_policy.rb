# frozen_string_literal: true

class ProgramPolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :program)
    def resolve
      if AdminUser.exists? user.id
        Program.includes([:programs, :trainings])
      else
        User.includes(programs: [:trainings]).find(user.id).programs
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
    user.id == program.user.id
  end

  def destroy?
    update?
  end
end
