module ApplicationHelper
	def flash_message
    flash_collection = []
	    if flash[:notice]
	      flash_collection << flash_type('info', flash[:notice])
	    elsif flash[:error]
	      flash_collection << flash_type('danger', flash[:error])
	    elsif flash[:alert]
	      flash_collection << flash_type('warning', flash[:alert])
	    elsif flash[:success]
	      flash_collection << flash_type('success', flash[:success])
	    end
	    return flash_collection.join.html_safe
  end
  
  def flash_type(type, message)
    button_properties = {
      :type => 'button', 
      :class => 'btn close',
      :'data-dismiss' => 'alert', 
      :'aria-label' => 'Close'
    }
    content_tag(:div, :class => "alert alert-#{type} alert-dismissible") do
      concat(message)
      concat(content_tag(:button, button_properties) do
          content_tag(:span, :'aria-hidden' => 'true') do
            concat('&times;'.html_safe)
          end
        end)
    end    
  end
end
