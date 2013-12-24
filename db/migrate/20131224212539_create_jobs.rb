class CreateJobs < ActiveRecord::Migration
  def change
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
end
