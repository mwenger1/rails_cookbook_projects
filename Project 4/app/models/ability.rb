class Ability
  include CanCan::Ability

  def initialize(user)
       user ||= User.new # guest user (not logged in)
       if user.has_role? :admin
         can :manage, :all
       else
         can :read, Organization
	       can :manage, Organization if user.has_role?(:owner, Organization)
	       can :write, Organization, :id => Organization.with_role(:manager, user).map(&:id)
       end
  end
end
