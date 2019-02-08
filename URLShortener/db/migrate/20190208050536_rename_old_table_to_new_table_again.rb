class RenameOldTableToNewTableAgain < ActiveRecord::Migration[5.2]
  def change
    rename_table :shortenedUrls, :shortenedurls
  end
end
