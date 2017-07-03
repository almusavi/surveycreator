class CreateTakeSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :take_surveys do |t|

      t.timestamps
    end
  end
end
