class UserMetaContent < ApplicationRecord
  belongs_to :user

  validate :meta_key, :meta_key_uniqueness

  def meta_key_uniqueness 
    unless self.user.user_meta_contents.select {|p| p.meta_key == self.meta_key}.size == 1
      errors.add(:meta_key, "must not contain duplicates ") 
    end
  end
end
