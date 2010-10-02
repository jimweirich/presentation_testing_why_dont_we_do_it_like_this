class CreateServiceTrips < ActiveRecord::Migration
  def self.up
    create_table :service_trips do |t|
      t.integer :contract_id, :null => false
      t.integer :service_tech_id, :null => false
      t.integer :missed_service_reason_id
      t.float   :discount, :default => 0.0, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :service_trips
  end
end
