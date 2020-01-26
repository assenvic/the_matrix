# frozen_string_literal: true

class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.datetime :start_time
      t.datetime :end_time

      # Since we only return by passphrase no need to index anything else
      # and it's unique because it's the identifier
      t.string :passphrase, index: true, null: false, unique: true

      t.timestamps
    end
  end
end
