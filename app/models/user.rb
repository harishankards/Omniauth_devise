class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :authentications

  def apply_omniauth(omniauth)
	  self.email = omniauth['info']['email'] if email.blank?
	  self.name = omniauth.info.name if name.blank?
	  # self.date_of_birth = omniauth.extra.raw_info.birthday
	  #self.password = '12345678' if name.password?
	  authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
	end

	def password_required?
	  (authentications.empty? || !password.blank?) && super
	end
end
