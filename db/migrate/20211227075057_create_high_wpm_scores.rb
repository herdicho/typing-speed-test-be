class CreateHighWpmScores < ActiveRecord::Migration[7.0]
  def change
    create_table :high_wpm_scores do |t|
      t.belongs_to :user
      t.belongs_to :timer
      t.belongs_to :language
      t.integer :wpm_score

      t.timestamps
    end
  end
end
