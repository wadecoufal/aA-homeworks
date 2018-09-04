require 'sqlite3'
require 'singleton'

class PlaywrightDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super(plays.db)
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright
