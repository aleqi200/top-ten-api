class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
    	t.string :title
        t.date :end_date
        t.integer :end_qty
        t.string :description
        t.string :style
        t.timestamps 
    end
  end
end
