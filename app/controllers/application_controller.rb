class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    private
      def logged_in_user
        unless signed_in?

          flash[:warning] = 'ログインしてください'
          redirect_to login_url
        end
      end
end
