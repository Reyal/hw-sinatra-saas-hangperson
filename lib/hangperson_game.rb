class HangpersonGame 

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
  def guess (letter)
    # Check if a valid letter
    if letter == nil or letter.size == 0 or letter.size > 1 or letter =~ /\W/
      raise ArgumentError.new('Guess cannot be blank, empty, a non alphabetic character, or more than one character')  
    end
    
    if self.guesses.include? letter or self.wrong_guesses.include? letter then false
      #Already guessed this letter
    else
      if self.word.include? letter then self.guesses = self.guesses + letter
      else self.wrong_guesses = self.wrong_guesses + letter
      end
    end
     
    
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
