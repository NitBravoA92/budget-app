class CreatePaymentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_categories do |t|
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.references :payment, null: false, foreign_key: { to_table: :payments }

      t.timestamps
    end
  end
end
