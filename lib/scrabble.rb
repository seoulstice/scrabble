class Scrabble
  require 'pry'
  attr_reader :word,
              :point_values
  def initialize
    @word = word
    @point_values = {
        "A"=>1, "B"=>3, "C"=>3, "D"=>2,
        "E"=>1, "F"=>4, "G"=>2, "H"=>4,
        "I"=>1, "J"=>8, "K"=>5, "L"=>1,
        "M"=>3, "N"=>1, "O"=>1, "P"=>3,
        "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
        "U"=>1, "V"=>4, "W"=>4, "X"=>8,
        "Y"=>4, "Z"=>10
      }
  end

  def score(word)
    score = []
    if word == ""
      return 0
    elsif word.nil?
      return 0
    else
      upcased = word.upcase
      split_word = upcased.split(//)
      split_word.each do |letter|
        score << @point_values[letter]
      end
      return score.inject(:+)
    end
  end

  def score_with_multipliers(word, double_letter, word_multiplier = 1)
    bonus = 0
    if word == ""
      return 0
    elsif word.nil?
      return 0
    else
      if word.length >= 7
        bonus += 10
      end
      upcased = word.upcase
      split_word = upcased.split(//)
      score = split_word.map do |letter|
        @point_values[letter]
      end
      total_score = score.zip(double_letter).map { |x, y| x * y }
    end
    score = (total_score.inject(:+) + bonus) * word_multiplier
  end
end
