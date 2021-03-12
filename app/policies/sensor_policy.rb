class SensorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    return true
  end

  def show?
    return true
  end

  def edit?
    return true
  end

  def new?
    return true
  end

  def update?
    return true
  end
  def destroy?
    return true
  end

  def download?
    return true
  end

  def delete_image_attachment?
    return true
  end

  def add_image_attachment?
    return true
  end


end
