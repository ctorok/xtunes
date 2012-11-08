class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new || user.user_type = "G" # guest user (not logged in). 
    # Set user to User.new if it does not already exist. The "if it does not exist" is defined by the logical assignment operator ||=
    can :read, :all

    case user.user_type
      when "A"
        can :manage, :all
      when "U"
        can :manage, Song do |song|
            song.try(:user) == user #can only manage songs they own 
        end
    end
  end
end
