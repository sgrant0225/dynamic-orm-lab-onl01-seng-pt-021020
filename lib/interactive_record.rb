require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'
class InteractiveRecord
  
  def self.column_names
   DB[:conn].results_as_hash = true
   sql = "PRAGMA table_info('#{table_name}')"
   table_info = DB[:conn].execute(sql)
   column_names = []
   table_info.each do |row|
     column_names << row["name"]
   end
   column_names.compact
 end
 
  self.column_names.each do |col_name|
    attr_accessor col_name.to_sym
  end
 
 def initialize(options={})
   options.each do |property, value|
     self.send("#{property}=", value)
   end
  end 
   
end