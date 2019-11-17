module ControllerMacros
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = create(:user, email: "user@example.com", password: "verysecret")
    sign_in user
  end
end
