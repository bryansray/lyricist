ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :tls => true,
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => 'lyricistapp.com',
  :authentication => :plain,
  :user_name => 'mailer@lyricistapp.com',
  :password => 'lyricistftw'
}