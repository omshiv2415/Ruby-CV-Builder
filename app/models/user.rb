class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :people
  has_many :educatioal_qualifications
  has_many :experiences
  has_many :referees
  has_many :skills
  has_many :jobpreference

  accepts_nested_attributes_for :people, :educatioal_qualifications, :experiences, :referees, :skills, :jobpreference
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
