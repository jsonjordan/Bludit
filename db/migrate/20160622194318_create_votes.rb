class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :message, index: true, foreign_key: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
