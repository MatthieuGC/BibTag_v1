# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  nom                :string
#  email              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string
#  salt               :string
#

class User < ActiveRecord::Base
  # Défini un accesseur
  attr_accessor :password
  # A plusieurs
  has_many :resource_collections
  # Expression régulière pour le contrôle des emails
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Conditions de validation de certains champs.
  validates :nom, 
    :presence => true, # Doit être présent
    :length => { :maximum => 50 } # Longueur max 50 caractères 
  validates :email, 
    :presence => true, # Doit être présent
    :format => { :with => email_regex }, # Controle le format avec le regex
    :uniqueness => { :case_sensitive => false } # Doit être unique, ne prend pas en compte les majuscules.
  validates :password, 
    :presence => true, # Doit être présent
    :confirmation => true, # Doit être confirmé (renseigné une seconde fois)
    :length => { :within => 6..40 } # Taille min 6 caractères, max 40 caractères.
  before_save :encrypt_password # Avant d'enregistrer, crypter le mot de passe.
  
  # Vérifie que la concordance du mot de passe renseigné avec le vrai.
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  # Permet l'authentification d'un utilisateur
  def self.authenticate(email, submitted_password)
    # Cherche l'utilisateur avec l'email renseigné
    user = find_by_email(email)
    # Echoue si introuvable
    return nil if user.nil?
    # Identifie l'utilisateur si le mot de passe renseigné est correct
    return user if user.has_password?(submitted_password)
  end

  # 
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  # Permet de crypter le mot de passe
  private def encrypt_password
    # Créé une donnée supplémentaire aléatoire pour la sécurité du mot de passe.
    # = Salage
    self.salt = make_salt if new_record?
    # Crypte le mot de passe.
    self.encrypted_password = encrypt(password)
  end

  # Crypte le mot de passe avec le "salage".
  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  # Créé le salage avec le temps à l'instant de la création. (YY/MM/JJ/h/m/s)
  def make_salt
    secure_hash("#{Time.new.utc}--#{password}")
  end
  
  # Fonction d'encryptage / sécurité
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
