class Delivery < ActiveRecord::Base

  # ASSOCIATIONS	
  belongs_to :user
  belongs_to :agent, foreign_key: :agent_id, class_name: "User"
  has_many :user_bags
  accepts_nested_attributes_for :user_bags
end
