# frozen_string_literal: true

# https://www.codewars.com/kata/5672a98bdbdd995fad00000f
# Rock Paper Scissors
# Let's play! You have to return which player won! In case of a draw return Draw!.

require_relative 'errors/not_rps_argument_error'

##
# Describes RockPaperScissors game
# Raise an error if initial parameters do not meet games criteria
class RockPaperScissors
  OPTIONS = %i[rock paper scissors].freeze
  WINS = { paper: :rock, scissors: :paper, rock: :scissors }.freeze

  def initialize(choice1, choice2)
    @choice1 = choice1
    @choice2 = choice2

    raise_error_if_choice_not_valid choice1
    raise_error_if_choice_not_valid choice2
  end

  def raise_error_if_choice_not_valid(choice)
    raise_rsp_argument_error unless OPTIONS.include?(choice)
  end

  def raise_rsp_argument_error
    rpse = NotRpsArgumentError.new(OPTIONS)
    raise rpse
  end

  def wins?(choice)
    winner == choice
  end

  def draw?
    winner == :draw
  end

  def winner
    return :draw if @choice1 == @choice2

    WINS[@choice1] == @choice2 ? @choice1 : @choice2
  end
end
