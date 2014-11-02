class CreateEventsParticipants < ActiveRecord::Migration
  def change
    create_table :events_participants do |t|
    	t.references :event
    	t.references :participant
      t.timestamps null: false
    end
  end
end
