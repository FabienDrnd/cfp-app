require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
  provider :open_id, :store => OpenID::Store::Filesystem.new('/tmp')
  use OmniAuth::Strategies::OpenID, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'yahoo', :identifier => 'yahoo.com'
  provider :developer unless Rails.env.production?
end
