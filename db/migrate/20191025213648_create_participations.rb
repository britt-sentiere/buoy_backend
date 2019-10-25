class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.integer :course_id
      t.integer :student_id

      t.timestamps
    end
  end
end
