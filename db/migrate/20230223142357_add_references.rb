class AddReferences < ActiveRecord::Migration[7.0]
  def change
  remove_column :bookmarks,  :list_id
  remove_column :bookmarks,  :movie_id
  add_reference :bookmarks, :list
  add_reference :bookmarks, :movie
  end
end
