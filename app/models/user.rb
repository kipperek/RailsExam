class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.nick = auth["info"]["nickname"]
      if(User.size == 0)
      	user.is_admin = true
      else
      	user.is_admin = false
      end
    end
  end
end
