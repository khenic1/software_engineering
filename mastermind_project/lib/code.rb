class Code



  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

    attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.each do |char|
       return false if !POSSIBLE_PEGS.has_key?(char.upcase)
    end
    return true
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      upcase_pegs = chars.map(&:upcase)
      @pegs = upcase_pegs
    else 
      raise "pegs are invalid"
    end

  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      count += 1 if guess[i] == self[i]
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if guess[i] != self[i] && self.pegs.include?(guess[i])
        count += 1
      end
    end
    count

  end

  def ==(other_code)
    other_code.pegs == self.pegs
  end
end
