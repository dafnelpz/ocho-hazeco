ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :email, :password, :password_confirmation # PONER LOS PARÁMETROS QUE QUIERO QUE SE PUEDAN MODIFICAR
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
		column :phone
		column :address
		column :email

		actions
	end

	form do |f|
		f.inputs "User Info" do
			f.input :name
			f.input :email
			f.input :password
			f.input :password_confirmation
		end
	f.actions
	end

	show do
		attributes_table do
			row :name
			row :email
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
