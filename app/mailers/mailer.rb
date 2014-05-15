class Mailer < ActionMailer::Base
  default from: "youchallenger@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'www.yourchallenger.com/signin'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
