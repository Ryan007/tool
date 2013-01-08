# encoding: utf-8  
module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /home\s?page/
        root_url
    when /主页/
        root_url
    when /signup/
        sign_up_users_path
    when /the list of clicks/
        clicks_path
    when /the login page/
        user_session_path
    else
        raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end
World(NavigationHelpers)