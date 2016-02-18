if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'sr-bazaar.herokuapp.com',
    user_name:            Rails.application.secrets[:GMAIL_USERNAME],
    password:             Rails.application.secrets[:GMAIL_PASSWORD],
    authentication:       'plain',
    enable_starttls_auto: true
  }
end
