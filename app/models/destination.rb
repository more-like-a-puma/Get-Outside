# == Schema Information
#
# Table name: destinations
#
#  id          :integer          not null, primary key
#  address     :text
#  country     :text
#  terrain     :text
#  image       :text
#  description :text
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Destination < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
end
