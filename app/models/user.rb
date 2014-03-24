class User < ActiveRecord::Base
  has_secure_password

  # Validations
  validates :email,
              :presence   => true,
              :uniqueness => true,
              :format     => { 
                :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                :message => "Enter valid email"
              }

  validates :password,
              :confirmation => true,
              :length       => { :in => 6..20 },
              :on           => :create

  validates :password_confirmation,
              :presence => true,
              :on       => :create

  # Associations
  has_many :words

end