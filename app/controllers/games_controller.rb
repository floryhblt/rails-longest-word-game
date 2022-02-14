require "json"
require "open-uri"

class GamesController < ApplicationController
    def new
      @letters = ('a'..'z').to_a.shuffle[0..9]
    end

    def score
      guess = params[:word].scan(/\w/)
      @letters = params[:letters].scan(/\w/)
      @valid_guess = guess.all? { |letter| guess.count(letter) <= @letters.count(letter)}
      url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
      @response = JSON.parse(URI.open(url).read)
    
    #   if (@valid_guess == true) && (@response["found"] == true)
    #     @message = "Congratulations ! #{params[:word].upcase} is a valid english word !"
    #   elsif (@valid_guess == true) && (@response["found"] == false)
    #     @message = "Sorry but #{params[:word].upcase} is not a valid english word"
    #   else
    #     @message = "Sorry but #{params[:word].upcase} can't be built out of #{@letters}"
    #   end
    end
end
