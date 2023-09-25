# frozen_string_literal: true

class Ability
  include CanCan::Ability

    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.has_role?(:admin)
        can :manage, :all # can perform any action on any resource
        can :create, Joboffer # can publish job offers
        can :create, User # can create new user accounts
        can :read, Application # can see the applications made by users
      end
      if user.has_role?(:employee)
        can :read, Joboffer # can see the job offers
        can :create, Application # can apply to job offers
        can :update, User, id: user.id # can edit own profile
      end
    end
end
