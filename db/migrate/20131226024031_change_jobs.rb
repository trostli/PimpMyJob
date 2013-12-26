class ChangeJobs < ActiveRecord::Migration
  def up
    change_table :jobs do |t|
      t.string :company
    end
  end

  def down
    change_table :jobs do |t|
      t.remove :company
    end
  end
end
