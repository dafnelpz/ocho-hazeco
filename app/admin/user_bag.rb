ActiveAdmin.register UserBag do

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
		f.inputs "Bags" do
			f.input :user
			f.input :agent, :input_html => { :value => current_user.id }, as: :hidden
			f.input :bag
			f.input :delivery
			f.input :kg
		end
	f.actions
	end

end
