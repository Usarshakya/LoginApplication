require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, ENV['client_id'], ENV['client_secret'], {:redirect_path => "/oauth2callback"}
 
end