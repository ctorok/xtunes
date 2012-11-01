class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities



    user ||= User.new || user.user_type = "G" 
    # guest user (not logged in). Set user to User.new if it does not already exist. The "if it does not exist" is defined by the logical assignment operator ||=
    can :read, :all

    case user.user_type
      when "A"
        can :manage, :all
      when "U"
        can :manage, Song #do |song|
            #song && song.user == user #can only manage songs they own TO DO!
      # when "G"
      #   can :read, :all
    end
  end
end
