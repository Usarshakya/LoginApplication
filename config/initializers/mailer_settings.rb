ActionMailer::Base.smtp_settings = {
  :address                => 'smtp.gmail.com',
  :domain                 => 'mail.google.com',
  :port                   => 587,
  :user_name              => ENV['GMAIL_USERNAME'],
  :password               => ENV['GMAIL_PASSWORD'],
  :authentication         => 'login',
  :enable_starttls_auto   => true
}