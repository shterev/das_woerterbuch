class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|

      t.string :foreign_form
      t.string :known_form
      t.string :type
      t.string :specifics

      t.timestamps
    end
  end
end