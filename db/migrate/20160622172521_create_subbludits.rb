class CreateSubbludits < ActiveRecord::Migration
  def change
    create_table :subbludits do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
