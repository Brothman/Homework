class UserMailer < ApplicationMailer
  default from: 'shiykim@gmail.com'

  def welcome_email(user)
    @user = user
    @url = "http://google.com"
    mail(to: 'brothman7000@gmail.com', subject: 'Welcome to our Homework. ' )
  end

end
