module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)

    case page_name
    
    when /the homepage/
      '/'
    when  /the new post page/
        new_admin_post_path
    when /^the edit page for "(.*)"$/i
      edit_admin_post_path($1)
    when /the post admin page/
      admin_posts_path
    when /^the preview page for "(.*)"$/i
      preview_admin_post_path($1)
    when /the index page/
      root_path
    when /login/
      login_path
    when /^the post "(.*)"$/i
      $1
    when /^the page for "(.*)"$/i
      $1
    when /^the 404 page$/
      "/404"
    when /^the about page$/
      "/about"
      
    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
