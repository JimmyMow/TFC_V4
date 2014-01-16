class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    if params[:tweet]
      user = User.omniauth_security(params[:user_id], request.env['omniauth.auth'])
      current_user.twitter.update("#{params[:message]} via @FansChallenge -->  #{link_to post_url(params[:id]), post_url(params[:post_id])}")
      redirect_to post_url(params[:post_id])
    else
      redirect_to posts_url
    end
  end
  alias_method :twitter, :all
end
