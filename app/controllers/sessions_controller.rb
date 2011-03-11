# coding: utf-8

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      reset_session
      session[:user_id] = user.id
      redirect_to :root, :notice => "Erfolgreich angemeldet."
    else
      flash.now[:alert] = "Ungültige Benutzerdaten."
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to :root, :notice => "Sie wurden abgemeldet."
  end
end
