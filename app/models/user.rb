# frozen_string_literal: true


class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
<<<<<<< HEAD
 
=======
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #
>>>>>>> 6b232bb06013aaa22948154ac3244b378b992319
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates_presence_of :encrypted_password

  #  name_of_person gem
  has_person_name

  def display_name
    (first_name + "&nbsp;" + last_name).html_safe
  end
end
