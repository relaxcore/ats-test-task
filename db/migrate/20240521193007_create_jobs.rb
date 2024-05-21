# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'

    create_table :jobs, id: :uuid do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
