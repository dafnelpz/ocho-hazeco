class Delivery < ActiveRecord::Base

  # ASSOCIATIONS	
  belongs_to :user
  belongs_to :agent, foreign_key: :agent_id, class_name: "User"
  has_many :user_bags
  accepts_nested_attributes_for :user_bags

  # CALLBACKS
  after_initialize :initialize_user_bags

  # METHODS
  protected

  def initialize_user_bags
  	Bag.all.each do |bag|
  	  user_bags.build(bag_id: bag.id)
  	end
  end
end
