class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.belongs_to :subbludit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
