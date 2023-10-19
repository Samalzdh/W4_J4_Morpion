class Player

  @@player = 0
  @@mark = ""
  
    attr_accessor :pname, :pmark, :ppoints
  
    def initialize
      @pname = ""
      @pmark = ""
      @@player += 1
      @ppoints = 0
    end
  
    def infos
   
      @pname = ((gets.chomp).to_s).capitalize
      if @@player == 1 && @@mark == ""
        puts "\nChoisie tes armes ? ❌ or ⭕ ?"
        while @pmark != "X" && @pmark != "O" do
           @pmark = (gets.chomp).to_s.capitalize
        end
      elsif @@mark == "X"
        @pmark = "O"
      elsif @@mark == "O"
        @pmark = "X"
      end
      @@mark = @pmark
      puts "#{@pname} va jouer en tant que #{@pmark} !"
    end
  
  end