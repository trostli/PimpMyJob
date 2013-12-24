class CreateJobs < ActiveRecord::Migration
  def up
    create_table :jobs do |t|
      t.belongs_to :category
      t.string :title
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end

  def down
    drop_table :jobs
  end
end
