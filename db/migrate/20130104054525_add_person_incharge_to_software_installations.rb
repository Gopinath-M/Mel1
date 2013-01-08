class AddPersonInchargeToSoftwareInstallations < ActiveRecord::Migration
  def self.up

    add_column :software_installations, :person_incharge,  :integer

  end
end
