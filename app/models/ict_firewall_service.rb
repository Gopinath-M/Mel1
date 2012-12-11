class IctFirewallService < ActiveRecord::Base
  belongs_to :ict_firewall
  attr_accessible :one_way
end
