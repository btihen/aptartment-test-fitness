class User < ApplicationRecord

  after_create :create_tenant
  after_destroy :delete_tenant

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, request_keys: [:subdomain] # :validatable

  validates :email, uniqueness: true

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

  def delete_tenant
    Apartment::Tenant.drop(subdomain)
  end

  # look up what this does
  def self.find_for_authentication(warden_conditions)
    where(email: warden_conditions[:email],
          subdomain: warden_conditions[:subdomain]).first
  end

end
