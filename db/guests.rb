class Guest
  attr_reader :year, :occupation, :show, :group_show, :name, :db

  ALL = []

  def initialize(year:, occupation:, show:, group_show:, name:)
    @year = year
    @occupation = occupation
    @show = show
    @group_show = group_show
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def self.save (year, occupation, show, group_show, name, db)
    db.execute("INSERT INTO guests (year, occupation, show, group_show, name) VALUES (?, ?, ?, ?, ?)", year, occupation, show, group_show, name)
  end

  def self.make_db (db)
    self.all.each { |guest|
      self.save(guest.year, guest.occupation, guest.show, guest.group_show, guest.name, db)
    }
  end

end
