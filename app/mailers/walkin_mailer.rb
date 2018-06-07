class WalkinMailer < ApplicationMailer
  default from: 'notifications@cospace.com'

  def registration_confirmation
    @walkin = params [:walkin_member]
    @url    = 'http://cospace.com/login'
    mail(to: @walkin.email, subject: 'Complete your Membership'
  end

  def walkin_member
    # NOTE: Using `strong_parameters` gem
    params.require(:member).permit(:current_password, :password, :password_confirmation)
  end
end    