Jumpup::Heroku.configure do |config|
  config.app = 'chromie-wh'
end if Rails.env.development?
