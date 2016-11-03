class User < ApplicationRecord
  has_many :user_meta_contents, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :user_meta_contents, reject_if: :all_blank, allow_destroy: true
  
  validates :first_name, :last_name, presence: true
  validates :mobile_number, presence: true, length: { minimum: 10, maximum: 13 }, uniqueness: { message: "is taken already!" }, numericality: { only_integer: true }
  validates :email, presence: true, uniqueness: { message: "is taken already!" }
  validate :email_with_format_if_present
  validates_associated :user_meta_contents
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def email_with_format_if_present
    if email.present? and email_changed?
      return errors.add(:email, 'Not a valid email') unless email =~ VALID_EMAIL_REGEX
    end
  end
end
