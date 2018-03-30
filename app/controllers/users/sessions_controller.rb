class Users::SessionsController < Devise::SessionsController
  def create
    super
    set_flash_message(:notice, :signed_in_hello, name: current_user.first_name)
  end
end
