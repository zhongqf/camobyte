module Footnotes
  module Notes
    class SwitchUserNote < AbstractNote

      def initialize(controller)
        @users = User.all
        @current_user = controller.instance_variable_get("@current_user")
      end
      
      def content
        @users.map do |user|
          %(
            <a href="/users/sign_in?user[email]=#{user.email}&amp;user[password]=papapa" 
             data-method="post" rel="nofollow">#{link_text(user)}</a>
          )
        end.join("<br/>")
      end
      
      protected
        def link_text(user)
          (@current_user == user) ? "<b>#{user.email}</b>" : user.email
        end
    end

  end
end