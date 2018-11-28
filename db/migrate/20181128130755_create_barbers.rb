class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
  	create_table :barbers do |t|
  		t.text :name

  		t.timestamps
  	end

  	Barber.create :name => "Joe Doe"
  	Barber.create :name => "Elon Musk"
  	Barber.create :name => "Alisha Moon"
  	Barber.create :name => "Marie Fooo-bar"

  end
end