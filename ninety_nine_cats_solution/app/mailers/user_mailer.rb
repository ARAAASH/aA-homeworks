class UserMailer < ApplicationMailer
  default from: '99catsAdmin@example.com'

  def welcome_email(user)
    @user = user
    @url = "http://www.NinetyNineCats.com"
    mail(to: @user.username, subject: "Welcome to our site!")
  end
end
