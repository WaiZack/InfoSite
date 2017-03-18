class CreateDocumentUploaders < ActiveRecord::Migration[5.0]
  def change
    create_table :document_uploaders do |t|

      t.timestamps
    end
  end
end
