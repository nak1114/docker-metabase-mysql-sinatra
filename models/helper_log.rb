#!ruby -Ku
# -*- coding: utf-8 -*-


require 'active_record'
require 'csv'

ActiveRecord::Base.configurations = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(:development)

require_relative '../models/rsdjp_log'


def create_seed( class_name )
  puts "import #{class_name.to_s}"

  begin
    std_date=DateTime.parse('2017-02-24T12:30:45')
    class_name.delete_all
    ActiveRecord::Base.connection.execute('ALTER TABLE `rsdjp_logs` AUTO_INCREMENT = 1')
    100.times do |index|
      record = class_name.new
      record.date=std_date+(rand(20000)/100.0)
      record.name="田中"
      record.save
      p index if (index % 10)==0
    end
  end
end

create_seed(RsdjpLog)
