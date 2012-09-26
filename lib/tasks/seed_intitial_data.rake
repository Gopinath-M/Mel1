require 'rubygems'
namespace :department do
  desc 'insert department data in db'
  task :update => :environment do
    begin
      file = File.open("public/Department.csv", "r")
      file.readlines.each_with_index do |record, i|
        begin
          Department.create(:name=>record)
        rescue Exception =>e
          p "Exception ocurred due to #{e.to_s} at #{i}"
        end
      end
    rescue Exception=>e
      p "Exception due to : #{e.to_s}"
    end
  end
end

namespace :state do
  desc 'insert state data in db'
  task :update => :environment do
    begin
      file = File.open("public/State.csv", "r")
      file.readlines.each_with_index do |record, i|
        begin
          record_split = record.split(",")
          State.create(:name=>record_split[0],:code=>record_split[1], :tel_code=>record_split[2])
        rescue Exception =>e
          p "Exception ocurred due to #{e.to_s} at #{i}"
        end
      end
    rescue Exception=>e
      p "Exception due to : #{e.to_s}"
    end
  end
end