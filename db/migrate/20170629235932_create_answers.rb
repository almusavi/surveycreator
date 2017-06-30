class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
    	t.string :answer_name
      t.string :question_id

      t.timestamps
    end
  end
end
