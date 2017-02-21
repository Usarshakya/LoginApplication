class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable, :lockable, :omniauthable, :omniauth_providers => [:facebook, :twitter, :google_oauth2]

  validates_presence_of :email
  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20] 
      user.name     = auth.info.name
      user.image    = auth.info.image

      
      if auth.provider == "twitter" 
        user.email = auth.uid + "@twitter.com"          
      else
        user.save
      end
    end
  end

  # def facebook
  #   @facebook ||= Koala::Facebook::API.new(oauth_token)
  # end
    
  # def normalimage  	
  #   "http://graph.facebook.com/#{self.uid}/picture?type=normal"    
  # end

end

