ActiveAdmin.register Delivery do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :user_id, :agent_id, user_bags_attributes: [:bag, :kg]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	form do |f|
		f.inputs "Delivery" do
			f.input :user
			f.input :agent_id, :input_html => { :value => current_user.id }, as: :hidden
		end

		f.inputs "Bags", :for => :user_bags do |bag_f|
			bag_f.input :bag, :label => bag_f.object.bag.color, :as => :readonly
			bag_f.input :kg
		end

	f.actions
	end

	index do
		column :user
		column :created_at

		actions
	end

end
