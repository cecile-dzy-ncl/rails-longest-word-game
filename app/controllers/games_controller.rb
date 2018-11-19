require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << [*('A'..'Z')].sample(1).join }
    @letters
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    serialized_word = open(url).read
    word_object = JSON.parse(serialized_word)
    if word_object['found'] == false
      @result = "This word does not exist!"
    elsif @word.upcase.chars.all? { |letter| @word.upcase.count(letter) <= @letters.count(letter) }
      @result = "Yeah"
    else
      @result = "Sorry this is not in the grid"
    end
  end
end

# We want to handle three scenarios:

# The word can't be built out of the original grid
# The word is valid according to the grid, but is not a valid English word
# The word is valid according to the grid and is an English word
# (You can use this API to check if a word is valid.)

# At the bottom of the results, add a link_to to go back to the New game page.
