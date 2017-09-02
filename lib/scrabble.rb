class Scrabble
  require 'pry'
  attr_reader :point_values,
              :scored_letters
  def initialize
    @point_values = {
        "A"=>1, "B"=>3, "C"=>3, "D"=>2,
        "E"=>1, "F"=>4, "G"=>2, "H"=>4,
        "I"=>1, "J"=>8, "K"=>5, "L"=>1,
        "M"=>3, "N"=>1, "O"=>1, "P"=>3,
        "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
        "U"=>1, "V"=>4, "W"=>4, "X"=>8,
        "Y"=>4, "Z"=>10
      }
    @scored_letters = []
  end

  def score(word)
    @scored_letters = []
    if evaluate_if_word_nil_or_empty(word).nil?
      upcased = word.upcase
      translate_split_word(upcased)
      return scored_letters.inject(:+)
    end
  end

  def translate_split_word(word)
    word.split(//).each do |letter|
      scored_letters << @point_values[letter]
    end
  end

  def evaluate_if_word_nil_or_empty(word)
    if word == "" || word.nil?
      return 0
    end
  end

  def score_with_multipliers(word, double_letter, word_multiplier = 1)
    bonus = 0
    if evaluate_if_word_nil_or_empty(word).nil?
      if word.length >= 7
        bonus += 10
      end
      upcased = word.upcase
      translate_split_word(upcased)
      total_score = scored_letters.zip(double_letter).map { |x, y| x * y }
    end
    (total_score.inject(:+) + bonus) * word_multiplier
  end
end
