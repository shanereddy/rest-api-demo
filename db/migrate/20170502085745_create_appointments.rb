class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :nurse, foreign_key: true
      t.date :appointment_date
      t.time :starttime
      t.time :endtime

      t.timestamps
    end
  end
end
