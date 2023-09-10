class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # Guest user
  
      if user.admin?
        can :destroy, Post
      else
        can :destroy, Post, user_id: user.id
      end
    end
  end
  