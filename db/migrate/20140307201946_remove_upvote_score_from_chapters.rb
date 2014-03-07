class RemoveUpvoteScoreFromChapters < ActiveRecord::Migration
  def change
  	remove_column :chapters, :upvote_score
  end
end
