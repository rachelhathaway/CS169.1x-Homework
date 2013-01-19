class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
  return [rps_game_winner(m1), rps_game_winner(m2)]
end

def rps_game_winner(game)
  # YOUR CODE HERE
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |g|
    g[-1].upcase!
    raise NoSuchStrategyError unless (g[-1] == "R" || g[-1] == "P" || g[-1] == "S")
  end
  p1s = game[0][-1]
  p2s = game[-1][-1]
  # puts "#{game[0][0]} : #{game[0][1]} -- VS. -- #{game[1][0]} : #{game[1][1]}"
  # puts ((p1s == p2s) || (p1s == 'R' && p2s == 'S') || (p1s == 'S' && p2s == 'P') || (p1s == 'P' && p2s == 'R')) ? "Winner: #{game[0][0]}" : "Winner: #{game[1][0]}"
  return game[0] if ((p1s == p2s) || (p1s == 'R' && p2s == 'S') || (p1s == 'S' && p2s == 'P') || (p1s == 'P' && p2s == 'R'))
  return game[-1]
end


def rps_tournament_winner(tournament)
  winners = []
  begin
    return rps_game_winner(tournament)
  rescue WrongNumberOfPlayersError, NoMethodError
    begin 
      return rps_game_winner(rps_result(tournament[0], tournament[1]))
    rescue
      tournament.each { |t| winners.push(rps_tournament_winner(t))}
    end
  end
  return rps_tournament_winner(winners) 
end
