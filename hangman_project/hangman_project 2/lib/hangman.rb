class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word #why is it self?
    DICTIONARY.sample
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word= Hangman.random_word
    @guess_word = []
    (0...@secret_word.length).each{|i| @guess_word<<'_'}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    @secret_word.split('').each_index.select{|i| @secret_word[i] == char}
  end

  def fill_indices(char, arr_ind)
    arr_ind.each do |i|
      @guess_word[i]=char
    end
  end

  #PART 2
  def try_guess(char)
    if already_attempted?(char)  #why no @ or self?
      print('that has already been attempted')
      return false
    else
      @attempted_chars<<char
      indices = get_matching_indices(char)
      fill_indices(char, indices)
      if indices.empty?
        @remaining_incorrect_guesses-=1
      end
      return true
    end
  end
  
  def ask_user_for_guess
    print('Enter a char:')
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join ==@secret_word
      p "WIN"
      return true
    else
      return false
    end
  end
  def lose?
    if @remaining_incorrect_guesses==0
      p "LOSE"
      return true
    else
      return false
    end
  end
  
  def game_over?
    if self.win? || self.lose?  #why do we use self here, but not in other function calls?
      print @secret_word
      return true
    else
      return false
    end
  end

end
