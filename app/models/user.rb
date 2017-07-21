class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable,
    :omniauthable, :omniauth_providers => [:google_oauth2]

    def self.find_for_google_oauth2(access_token)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    return user unless user.nil?

    registered_user = User.where(:email => data["email"]).first
    return registered_user unless registered_user.nil?

    User.create(
      name: data["name"],
      provider: access_token.provider,
      email: data["email"],
      uid: access_token.uid ,
      image: data["image"],
      password: Devise.friendly_token[0,20]
    )
  end
end
