require 'pry'
module Players
  class Computer < Player
    def move(board)
      move = nil
      ##opening moves for 2 computers, or for if computer is playing a human and is either player_1 or player_2
        if !board.taken?('5')
          move = "5"
        elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = [1,3,7,9].detect{|cell| !board.taken?(cell)}.to_s
      elsif board.turn_count == 3 && (board.position(1) == board.position(9)  || board.position(3) == board.position(7)) #human setting trap
        move = "2" #spring_trap
      else
        Game::WIN_COMBINATIONS.detect do |combo_wombos|
          if combo_wombos.select{|i| board.position(i+1) == token}.size == 2 && combo_wombo.any?{|i| board.position(i+1) == " "}
            move = combo_wombos.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          elsif combo_wombos.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo_wombos.any?{|i| board.position(i+1) == " "}
            move = combo_wombos.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
        move = [1,2,3,4,5,6,7,8,9].detect{|i| !board.taken(i)}.to_s if move == nil
      end #end of big ass conditional
    end #end of def
  end
end
#


"Ok fucking aweseome i just lost ALL of my pseudo code writing that I had worked on for the last two hours
but don't worry a lot of it was repetitive and got you toward a final step tree, from what I can remember it looked like this:

rules:
always go for middle first, then go for a corner
if human sets a trap, be ready with code for spring_trap
always block first


computer is player_1
1. middle
2. corner
3. block, complete win_combo, corner that has blank space between move 2. and itself
4. complete win_combo, go towards win_combo
5. block, fill in dead spot

computer is player_2
1. middle if not taken or corner
2. block, spring_trap, or corner
3. block, or complete win_combo
4. block, fill in dead spot, go towards win_combo, complete win_combo


two computers as player_1 and player_2 should always draw:
1. middle
2. corner
3. corner
4. block or corner
5. block
6. block
7. go towards win_combo
8. block
9. dead spot or block


to do list:
  3. figure out the conditional of 0, 1, or 2 players for the bin.???

  God that pissed me off but I feel better now.


"
