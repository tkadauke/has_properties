PluginTestEnvironment::Migration.setup do 
  create_table :shapes do |t|
    t.integer :x
    t.integer :y
    t.text :data
  end
end
