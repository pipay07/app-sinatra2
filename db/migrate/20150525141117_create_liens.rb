class CreateLiens < ActiveRecord::Migration
  def change
  	create_table :liens do |t|
  		t.string :nom
  		t.string :url
  		t.string :description
  		t.string :profil
  		t.string :domaine
  		
  		t.timestamps
  	end
  end
end

