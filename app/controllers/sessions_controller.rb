class SessionsController < ApplicationController
  def new
    @titre = "Sign in!"
  end

  # Pour d'identification d'un utilisateur (= Nouvelle session)
  def create
    # Récupère l'email et le mdp de l'utilisateur pour l'identification
    # Appel à la fonction "authenticate" créé dans models/user.rb
    @user = User.authenticate(params[:session][:email], params[:session][:password])
    # Si l'authentification a échoué, on affiche un message d'erreur
    if @user.nil?
      flash.now[:error] = "Email or password incorrect!"
      render 'new'
    # Sinon on créé sa session et on le redirige vers sa page perso.
    else
      sign_in @user
      redirect_to @user
    end
  end

  # Pour la déconnexion d'un utilisateur
  def destroy
    sign_out
    redirect_to root_path
  end
end
