class CreateMissedServiceReasons < ActiveRecord::Migration
  def self.up
    create_table :missed_service_reasons do |t|
      t.string :description
      t.string :code

      t.timestamps
    end

    add_index :missed_service_reasons, [:code], :unique => true
  end

  def self.down
    remove_index :missed_service_reasons, :code
    drop_table :missed_service_reasons
  end
end
