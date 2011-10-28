class Notifier < ActionMailer::Base
  default :from => "al099507@alumail.uji.es"

  def welcome(user)
    @user=user
    mail(:to => "al099507@uji.es", :subject => "Wellcome to My Colegio")
  end
end

