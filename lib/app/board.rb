class Board

  attr_accessor :cases, :choice

  def initialize
      # On initialise 9 cases jouables à la création d'une board
    bc_1 = BoardCase.new(1, "1")
    bc_2 = BoardCase.new(2, "2")
    bc_3 = BoardCase.new(3, "3")
    bc_4 = BoardCase.new(4, "4")
    bc_5 = BoardCase.new(5, "5")
    bc_6 = BoardCase.new(6, "6")
    bc_7 = BoardCase.new(7, "7")
    bc_8 = BoardCase.new(8, "8")
    bc_9 = BoardCase.new(9, "9")
    @cases = [bc_1, bc_2, bc_3, bc_4, bc_5, bc_6, bc_7, bc_8, bc_9]
  end

  def show
    puts "\n     |     |     "
    puts "  #{cases[0].value}  |  #{cases[1].value}  |  #{cases[2].value}  "
    puts "_____|_____|_____"
    puts "     |     |     "
    puts "  #{cases[3].value}  |  #{cases[4].value}  |  #{cases[5].value}  "
    puts "_____|_____|_____"
    puts "     |     |     "
    puts "  #{cases[6].value}  |  #{cases[7].value}  |  #{cases[8].value}  "
    puts "     |     |     "
  end

  def get_player_choice(choice, pmark, player)
    self.set_case_value(choice, pmark, player)
  end

  def set_case_value(choice, pmark, player)
      # On change la valeur de la case choisie par la marque du joueur, en ajoutant de la couleur
    if is_playable?(@cases[choice-1])
      if pmark == "O"
        @cases[choice-1].value = pmark
      else
        @cases[choice-1].value = pmark
      end
    else
      puts "Occupé! choisie une autre case !"
      choice = (gets.chomp).to_i
      self.set_case_value(choice, pmark, player)
    end
  end

  def is_playable?(cell)
      # Regarde si la case est deja modifiée
    if cell.value.to_i == cell.name
      return true
    else
      return false
    end
  end


  def victory(player)
      # Toutes les conditions de victoire (8 au total)

    if @cases[0].value == @cases[1].value && @cases[1].value == @cases[2].value
      return true

    elsif @cases[3].value == @cases[4].value && @cases[4].value == @cases[5].value
      return true

    elsif @cases[6].value == @cases[7].value && @cases[7].value == @cases[8].value
      return true

    elsif @cases[0].value == @cases[3].value && @cases[3].value == @cases[6].value
      return true

    elsif @cases[1].value == @cases[4].value && @cases[4].value == @cases[7].value
      return true

    elsif @cases[2].value == @cases[5].value && @cases[5].value == @cases[8].value
      return true

    elsif @cases[2].value == @cases[4].value && @cases[4].value == @cases[6].value
      return true

    elsif @cases[0].value == @cases[4].value && @cases[4].value == @cases[8].value
      return true

    end
  end

end