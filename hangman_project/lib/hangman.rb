class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {'_'}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    @secret_word.chars.each_with_index.inject([]) do |arr, (el, i)|
      arr << i if el == char
      arr
    end
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      matching_indices = get_matching_indices(char)
      @remaining_incorrect_guesses -= 1 if matching_indices.empty?
      fill_indices(char, matching_indices)
      return true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word == @secret_word.chars
      puts "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    false
  end
end
