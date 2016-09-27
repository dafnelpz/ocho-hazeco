ActiveAdmin.register User do

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

permit_params :id, :agent, :name, :email, :phone, :address, :encrypted_password # PONER LOS PARÁMETROS QUE QUIERO QUE SE PUEDAN MODIFICAR
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

		actions
	end

	filter :name
	filter :email
	filter :phone
	filter :address

	form do |f|
		f.inputs "User Info" do
			f.input :name
			f.input :email
			f.input :phone
			f.input :address
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
