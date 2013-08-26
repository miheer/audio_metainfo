class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :audio_file_file_name
      t.string :audio_file_content_type
      t.integer :audio_file_file_size
      t.datetime :audio_file_updated_at
      t.timestamps
    end
  end
end

