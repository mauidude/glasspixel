class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable,
          :token_authenticatable,
          :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_protected :email,
                  :password,
                  :password_confirmation

  attr_accessible :remember_me

  validates :email,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :email => true

  validates :password,
            :presence => { :on => :create },
            :length => { :minimum => 6, :maximum => 15, :allow_blank => true, :if => :password_required? },
            :confirmation => { :if => :password_required? }

  private

  def password_required?
    !password.blank?
  end
end
