class UserMailer < ApplicationMailer
    default from: 'no-reply@kidsmapp.com.mx'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user['email'], subject: 'Welcome to My Awesome Site')
  end

  def welcome_email_user
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user['email'], subject: 'Welcome to My Awesome Site')
  end

end
