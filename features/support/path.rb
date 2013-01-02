# encoding: utf-8  
module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /home\s?page/
      root_path
    when /主页/
      root_path
    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end
World(NavigationHelpers)