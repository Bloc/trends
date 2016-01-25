class Repository < ActiveRecord::Base
  scope :stale,     -> { where("last_synced_at IS NULL OR last_synced_at < ?", 30.days.ago) }
  scope :fresh,     -> { where("last_synced_at IS NOT NULL AND last_synced_at > ?", 30.days.ago) }
  scope :not_fork,  -> { where(fork: false) }

  def self.repos_by_month(options={})
    if language = options[:language]
      connection.execute(%{
        SELECT date_trunc('month', created_at), COUNT(*)
        FROM repositories
        WHERE last_synced_at IS NOT NULL AND language=#{sanitize(language)}
        GROUP BY 1 ORDER BY 1
      })
    else
      connection.execute(%{
        SELECT date_trunc('month', created_at), COUNT(*)
        FROM repositories
        WHERE last_synced_at IS NOT NULL
        GROUP BY 1 ORDER BY 1
      })
    end
  end
end
