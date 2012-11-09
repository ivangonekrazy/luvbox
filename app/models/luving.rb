class Luving < ActiveRecord::Base
  attr_accessible :comment, :luved_id, :luver_id

  belongs_to :luver, class_name: "User"
  belongs_to :luved, class_name: "User"

  validates_associated :luver
  validates_associated :luved

end
