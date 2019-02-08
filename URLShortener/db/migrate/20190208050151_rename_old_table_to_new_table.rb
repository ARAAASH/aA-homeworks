class RenameOldTableToNewTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :shortened_urls, :shortenedUrls
  end
end
