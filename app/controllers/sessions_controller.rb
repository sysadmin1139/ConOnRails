class SessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create, :getroles]

  private
  def ip()
    request.env['HTTP_X_FORWARDED_FOR'] || request.remote_ip
  end

  public

  def new
    @title = "Mr X., Sign in please!"
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      setup_session user
      flash[:notice] =  "Logged in!"
    else
      log_failure
      flash[:notice] = "Invalid username or password"
    end
    redirect_to root_url
  end

  def destroy
    @title = "Goodbye!"
    LoginLog.create! user_name: (current_user ? current_user.name : "nobody"),
                     role_name: current_role, comment: :logout, ip: ip
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  def getroles
    begin
      @rolenames = User.find_by_name(params[:name]).roles.collect { |r| r.name }
    rescue NoMethodError
      @rolenames = []
    end
  end

  protected

  def setup_session(user)
    reset_session
    session[:user_id]      = user.id
    session[:current_role] = params[:role]
    LoginLog.create! user_name: user.name, role_name: params[:role], comment: :success, ip: ip()
  end

  def log_failure
    LoginLog.create! user_name: params[:name], role_name: params[:role], comment: :failure, ip: ip()
  end
end
