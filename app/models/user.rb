class User < ApplicationRecord
  validates :name ,presence: true
  validates :email ,presence: true
  validates :password ,presence: true
  has_many :tasks, dependent: :destroy
  has_secure_password


  before_destroy :admin_destroy
  before_update :admin_update

  private
  def admin_destroy
    if User.where(admin:"true").count == 1 && self.admin == true
        throw :abort
    end
  end

  def admin_update
    if User.where(admin:"true").count == 1 && self.admin == false
        throw :abort
    end
  end

end
