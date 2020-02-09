class SessionsController < ApplicationController
  def new
  end
  
  def create
    
  end
  
  def destroy
    
  end
  
  private
    def log_in(user)
      session[:user_id] = user.id
    end
  
    def log_out
      #Railsに事前定義されているsession.deleteメソッドでSessionを削除
      session.delete(:user_id)
      @current_user = nil
    end
  
    def session_params
      params.require(:session).permit(:email, :password)
    end
end