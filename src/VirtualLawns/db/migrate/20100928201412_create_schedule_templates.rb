class CreateScheduleTemplates < ActiveRecord::Migration
  def self.up
    create_table :schedule_templates do |t|
      t.string :description
      t.string :algorithm

      t.timestamps
    end
  end

  def self.down
    drop_table :schedule_templates
  end
end
