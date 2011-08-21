module ProfilesHelper
  def render_profile(profile)
    render "profiles/profile", :profile => profile if profile
  end

end