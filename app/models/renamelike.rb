class RenameLikes
    def change
        rename_column :your_table_name, :old_column_name, :new_column_name
      end
end