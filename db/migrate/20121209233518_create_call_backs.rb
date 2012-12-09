class CreateCallBacks < ActiveRecord::Migration
  def change
    create_table :call_backs do |t|
      t.string :username
      t.string :repository
      t.string :url
      t.text :payload

      t.timestamps
    end
  end
end
