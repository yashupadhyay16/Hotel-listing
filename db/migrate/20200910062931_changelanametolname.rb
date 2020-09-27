class Changelanametolname < ActiveRecord::Migration[6.0]
  def change
    rename_column :resumes, :laname, :lname

  end
end
