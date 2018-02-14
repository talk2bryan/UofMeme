module ApplicationHelper
	
  def active_for(options = {})
    name_of_controller = options[:controller] || nil
    name_of_action     = options[:action]     || nil
    request_path       = options[:path]       || nil

    if request_path.nil?
      if (name_of_action.nil? or name_of_action == action_name) and
          name_of_controller == controller_name
        'active'
      else
        ''
      end
    else
      request_path == request.path ? 'active' : ''
    end
  end

end
