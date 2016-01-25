class GithubToken < ActiveRecord::Base
  scope :unclaimed, -> { where(claimed: false) }

  def unclaim!
    self.claimed = false
    self.save!
  end

  def basic_auth_string
    [username, token].join(":")
  end
end
