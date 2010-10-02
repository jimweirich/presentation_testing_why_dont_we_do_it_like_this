class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.date :starts_on
      t.date :ends_on
      t.integer :contract_id
      t.integer :service_template_id

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
