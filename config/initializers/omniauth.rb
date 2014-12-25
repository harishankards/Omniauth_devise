OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :scope => 'email,user_birthday,read_stream,publish_actions'
	provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
	provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
	provider :gplus, '907485343226-f9mj1om1ik5frfr3pblsif9nglhhb4q2.apps.googleusercontent.com', 'B-ZnafD-yuont4mNIEWX1nYO'
end