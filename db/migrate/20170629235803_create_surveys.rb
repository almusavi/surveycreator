class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :creator_id
      t.string :taker_id

      t.timestamps
    end
  end
end
