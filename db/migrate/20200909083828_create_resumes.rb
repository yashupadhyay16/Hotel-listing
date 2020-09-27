class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.string :fname
      t.string :laname
      t.string :email
      t.integer :contact
      t.string :experience
      t.string :role
      t.timestamps
    end
  end
end
