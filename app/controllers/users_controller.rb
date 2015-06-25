class UsersController < ApplicationController
  
  # Pour l'affichage des utilisateurs
  def show
    # On récupère l'utilisateur sélectionné
    @user = User.find(params[:id])
    @title = @user.nom
  end

  def new
    @user = User.new
    @title = "Sign up!"
  end
  
  # Pour l'inscription  d'un utilisateur
  def create
    # On créé un compte avec les champs renseigné par l'utilisateur
    @user = User.new(user_params)
    # Si ça fonctionne
    if @user.save
      sign_in @user
      # On le renvoi sur la page d'accueil avec un message de confirmation.
      redirect_to root_path, notice: "You are now registered !"
    # Sinon on rafraichi la page
    else
      @titre = "Sign Up!"
      render 'new'
    end
  end

  # Défini les champs modifiables dans la table USER
  def user_params
    params.require(:user).permit(:nom, :email, :password, :password_confirmation)
  end
end
