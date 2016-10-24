ActiveAdmin.register Delivery do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
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
			f.input :agent, :input_html => { :value => current_user.id }, as: :hidden
		end

		f.inputs "Bags", :for => [:user_bags, f.object.user_bags || UserBag.new] do |bag_f|
			bag_f.input :user
			bag_f.input :agent, :input_html => { :value => current_user.id }, as: :hidden
			bag_f.input :bag
			bag_f.input :delivery
			bag_f.input :kg
		end

	f.actions
	end

end
