SsoClient.configure do |config|
  # ----------------------
  #   Oauth2 infomations
  # ----------------------
  # For more information, contact your Oauth2 provider.
  #
  config.app_name = 'sub_system'
  config.sso_host = 'http://test1.huaxing.com'
  config.client_id = '9f1bfe3c72a023cbd4820f08f264684034ce61b7273b1d973074a6224dea2165'
  config.client_secret = '7138990b9cc05d8568f5a6b04db327a86f7a7cadddcd1a22e61da367ed4f1f5c'

  # Your auth_model. Default is User.
  # config.user_model = 'User'

  # Your Super Controller. Default is ApplicationController.
  # config.parent_controller = 'ApplicationController'

  # Resource url
  # config.resource_url = '/api/me.json'
  # config.user_page_url = '/users/me'
end
