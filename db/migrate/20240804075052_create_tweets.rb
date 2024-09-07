class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :title
      t.string :images
      t.text :comment

      t.timestamps
    end
  end
end
