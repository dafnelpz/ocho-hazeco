class UserBag < ActiveRecord::Base
  belongs_to :user
  belongs_to :bag
  belongs_to :delivery
end
