class GithubToken < ActiveRecord::Base
  scope :unclaimed, -> { where(claimed: false)  }
  scope :claimed,   -> { where(claimed: true)   }

  def self.claim!
    github_token = nil

    ActiveRecord::Base.transaction do
      if github_token = GithubToken.unclaimed.first
        github_token.claim!
      else
        raise "No Github Tokens Available"
      end
    end

    github_token
  end

  def claim!
    self.claimed = true
    self.save!
  end

  def unclaim!
    self.claimed = false
    self.save!
  end

  def basic_auth_string
    [username, token].join(":")
  end
end
