ActiveAdmin.register User do
	config.clear_action_items!

	# actions :all, except: [:destroy] unless current_user.role.admin

# controller.load_and_authorize_resource

# 	controller do
# 		def scoped_collection
# 			end_of_assocation_chain.accesible_by(current_ability)
# 		end
# 	end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

permit_params :id, :agent, :name, :email, :phone, :address, :encrypted_password, :role_id, :password, :password_confirmation # PONER LOS PARÁMETROS QUE QUIERO QUE SE PUEDAN MODIFICAR
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	index do
		column :name
		column :email
		column :phone
		if current_user.role.admin
			column :role
		end

		actions
	end

	filter :name
	filter :email

	form do |f|
		f.inputs "User Info" do
			f.input :role
			f.input :name
			f.input :email
			f.input :phone
			f.input :address
			f.input :password
			f.input :password_confirmation
		end
	f.actions
	end

	show do
		attributes_table do
			row :id
			row :agent
			row :name
			row :email
			row :phone
			row :address
		end
	end

	action_item :except => [:new, :show] do
	    # New link
	    if current_user.role.admin 
	    	if controller.current_ability.can?( :create, active_admin_config.resource_class ) and controller.action_methods.include?('new')
	      		link_to(I18n.t('active_admin.new_model', :model => active_admin_config.resource_name), new_resource_path)
	   		end
	   	end
  	end

	controller do
		def scoped_collection
			if (current_user.role.admin)
				@users = User.all
			elsif (current_user.role.agent)
				@users = current_user.users
			end
		end
	end
end
