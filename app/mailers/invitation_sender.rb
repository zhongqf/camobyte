class InvitationSender < ActionMailer::Base
  default from: "from@example.com"

  def project_invitation(invitation)
  end

  def signup_invitation(invitation)
  end
end
