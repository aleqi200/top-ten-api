class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :title
      t.integer :survey_id

      t.timestamps
    end
  end
end
