class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Micropost, user_id: user.id
    can :update, User, id: user.id
    can :destroy, User if user.admin?
    cannot :follow, User, id: user.id
  end
end
