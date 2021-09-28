class RenameGistsColumnGits < ActiveRecord::Migration[6.1]
  def change
    rename_column :gists, :gits_url, :gist_url
  end
end
