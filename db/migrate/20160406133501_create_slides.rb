class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :url
    end

    create_table :passwords do |t|
      t.string :password
    end
  end
end
