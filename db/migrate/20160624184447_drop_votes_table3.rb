class DropVotesTable3 < ActiveRecord::Migration
  def change
    drop_table :votes
  end
end
