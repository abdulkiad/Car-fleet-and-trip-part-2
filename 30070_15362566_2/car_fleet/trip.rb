# Trip object storing trip id and distance

class Trip

  attr_reader :id, :distance

  def initialize(id, distance)
    @id, @distance = id, distance
    @seats_needed=0
  end

  def people
    @seats_needed
  end
  def add_pass(seats_needed)
    @seats_needed=seats_needed
  end

end