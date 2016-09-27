ActiveAdmin.register User do

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
		column :agent

		actions
	end

	filter :role, as: :check_boxes
	filter :agent, as: :select
	filter :name, as: :string
	filter :phone
	filter :address, as: :string
	filter :email, as: :string
	filter :encrypted_password, as: :string

	form do |f|
		f.inputs "User Info" do
			f.input :agent
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
