class UserBag < ActiveRecord::Base
  belongs_to :user
  belongs_to :agent, foreign_key: :agent_id, class_name: "User"
  belongs_to :bag
  belongs_to :delivery
end
