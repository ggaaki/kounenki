class AddReleaseToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :release, :integer
  end
end
