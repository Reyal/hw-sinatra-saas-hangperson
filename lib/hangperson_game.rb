class HangpersonGame 

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  attr_reader :max_game_guesses
  
  def initialize(word)
    @word = word.downcase
    @guesses = ''
    @wrong_guesses = ''
    @max_game_guesses = 7
  end
  
  def guess (letter)
    # Check if a valid letter
    if letter == nil or letter.size == 0 or letter.size > 1 or letter =~ /\W/
      raise ArgumentError.new('Guess cannot be blank, empty, a non alphabetic character, or more than one character')  
    end
    lower_case_letter = letter.downcase
    if self.guesses.include? lower_case_letter or self.wrong_guesses.include? lower_case_letter then false
      #Already guessed this letter
    else
      if self.word.include? lower_case_letter then self.guesses = self.guesses + lower_case_letter
      else self.wrong_guesses = self.wrong_guesses + lower_case_letter
      end
    end
  end
  
  def check_win_or_lose
    case
    when self.guesses.length == self.word.length then :win
    when self.wrong_guesses.length == self.max_game_guesses then :lose
    else :play
    end
  end     
  
  def word_with_guesses
    if self.guesses == "" then 
      self.word.gsub(/./,"-")
    else
      self.word.gsub(/[^#{self.guesses}]/,"-")
    end
  end
  
  def self.get_random_word
   self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
end