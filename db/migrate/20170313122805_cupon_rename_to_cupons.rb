class CuponRenameToCupons < ActiveRecord::Migration[5.0]
  def change
  	rename_table :cupon, :cupons
  end
end
