class GamesController < ApplicationController
  def new
    @letters = []
    6.times { @letters << [*('A'..'Z')].sample(1).join }
    @letters
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
  end
end
