configure do
  enable :sessions

  use OmniAuth::Builder do
    provider :twitter, "1Uxp2O2Hqpbs2sTba8C4NhNGE", "lRJ1bFvNkiQnw8xOIuR2UfOykCyU37TdlWLBX12jihLSAbvdDY"
  end
end

# {
#   :provider => "twitter",
#   :uid => "123456",
#   :info => {
#     :nickname => "johnqpublic",
#     :name => "John Q Public",
#     :location => "Anytown, USA",
#     :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
#     :description => "a very normal guy.",
#     :urls => {
#       :Website => nil,
#       :Twitter => "https://twitter.com/johnqpublic"
#     }
#   },
#   :credentials => {
#     :token => "a1b2c3d4...", # The OAuth 2.0 access token
#     :secret => "abcdef1234"
#   }}