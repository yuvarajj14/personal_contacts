class CreateUserMetaContents < ActiveRecord::Migration[5.0]
  def change
    create_table :user_meta_contents do |t|
      t.belongs_to :user, index: true, foreign_key: true 	
      t.string :meta_key, default: ""
      t.string :meta_value, default: ""

      t.timestamps
    end
  end
end
