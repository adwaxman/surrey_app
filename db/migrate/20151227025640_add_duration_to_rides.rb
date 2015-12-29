class AddDurationToRides < ActiveRecord::Migration
      def change
        add_column :rides, :duration, :string
      end
end
