class Repository < ActiveRecord::Base
  scope :stale,     -> { where("last_synced_at IS NULL OR last_synced_at < ?", 30.days.ago) }
  scope :not_fork,  -> { where(fork: false) }
end
