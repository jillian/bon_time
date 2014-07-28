class RegistrationsController < Devise::RegistrationsController
 
  private
 
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile_number, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :mobile_number)
  end
end