class CreateJobCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :job_categories do |t|

      t.timestamps
    end
  end
end
