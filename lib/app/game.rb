class Game

  @@victory = false
  # Variable de classe qui permet de "casser" la loop si quelqu'un gagne

  def initialize  
    puts "--------------------------------------------------------------"
    puts "|                BIENVENUE DANS LE MORPION                   |"
    puts "|                                                            |"
    puts "| Tout les coups sont permis pour repartir avec la victoire !|"
    puts "--------------------------------------------------------------"
    puts
    puts "Joueur a ma gauche presentes toi : "
    @p_one = Player.new
    @p_one.infos
    puts
    puts "Joueur a ma droite presentes toi : "
    @p_two = Player.new
    @p_two.infos
    @board_game = Board.new
  end

  def go
    puts "C'est parti !"
    i = 0
    loop do
      break if i > 8
      # Pas plus de 9 étapes de jeu car après, la board est entièrement remplie !
      self.turn(@p_one)
      i +=1
      if @@victory
          # Win du player 1, break de la loop si besoin et affiche la board finie
        puts "\nGAME ! "
        @board_game.show
        puts "\nT'as dead ca #{@p_one.pname} !"
        puts "#{@p_two.pname}, U LOSE B!TCH!"
        break
      end
      break if i > 8
      self.turn(@p_two)
      i +=1
      if @@victory
          # Win du player 2, break de la loop si besoin et affiche la board finie
        puts "\nGAME ! "
        @board_game.show
        puts "\nT'as dead ca #{@p_two.pname} !"
        puts "#{@p_one.pname}, U LOSE B!TCH!! "
        break
      end
    end
    @board_game.show
    # Affiche la board lorsque le jeu est fini, et la board remplie entièrement
    puts "Egalité! c'etait bien nul tout ca." if @@victory == false
    # Si aucune victoire, affiche message d'égalité
    puts "#{@p_one.pname} : #{@p_one.ppoints} VS #{@p_two.pname} : #{@p_two.ppoints}"
    # Affiche l'état des points dans tous les cas à la fin
    puts "REVANCHE? BELLE ? Y/N"
    # Propose un nouveau jeu en gardant en mémoire les points
    choice = (gets.chomp).to_s.capitalize
    if choice == "Y"
      @@victory = false
      @board_game = Board.new
      self.go
    end

  end

  def turn(player)
    @choice = 0
    @board_game.show
    puts "C'est le tour de #{player.pname}"
    puts "Choisie un nombre entre 1 et 9 :"
    while !((1..9).include?(@choice)) do
      @choice = (gets.chomp).to_i
    end
    @board_game.get_player_choice(@choice, player.pmark, player)
    if @board_game.victory(player)
      @@victory = true
      player.ppoints += 1
    end
  end

end