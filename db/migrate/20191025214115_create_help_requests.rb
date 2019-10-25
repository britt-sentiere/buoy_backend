class CreateHelpRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :help_requests do |t|
      t.integer :participation_id
      t.datetime :completed_time

      t.timestamps
    end
  end
end
