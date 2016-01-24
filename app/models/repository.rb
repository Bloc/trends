class Repository < ActiveRecord::Base
  def self.count_by_year
    self.connection.execute()
  end
end
