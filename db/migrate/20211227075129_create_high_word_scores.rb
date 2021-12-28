class CreateHighWordScores < ActiveRecord::Migration[7.0]
  def change
    create_table :high_word_scores do |t|
      t.belongs_to :user
      t.belongs_to :timer
      t.belongs_to :language
      t.integer :word_score

      t.timestamps
    end
  end
end
