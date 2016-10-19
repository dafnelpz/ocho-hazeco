class ContactsController < ApplicationController
	def new
    	@contact = Contact.new
  	end

  	def create
	    @contact = Contact.new(params[:contact])
	    @contact.request = request
	    if @contact.deliver
	      flash[:notice] = '¡Gracias por escribirnos! Te contactaremos en breve 😉'
	      redirect_to (root_path)
	    else
	      flash[:error] = 'No se pudo enviar tu mensaje ☹️'
	      redirect_to (root_path)
   	 	end
  	end
end
