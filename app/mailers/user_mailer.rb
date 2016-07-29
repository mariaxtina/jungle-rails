class UserMailer < ApplicationMailer


  default from: 'no-reply@jungle.com'

  def order_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Order Confirmation')
  end
end
