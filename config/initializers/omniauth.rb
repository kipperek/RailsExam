# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "41810262d4ccdbd905dc", "a7b3ee878d2ce07375debe7c0265a367445ea76d"
end
