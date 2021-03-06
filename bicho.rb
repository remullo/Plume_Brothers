require 'player'

class Enemy
  attr_reader :x, :y, :tela, :mons, :mons2, :vivo, :pl, :speed, :player, :monstro
  def initialize(window)
    @tela = window
   
	@mons = Gosu::Image.new(@tela, 'img/monster.png', true) 
	#@mons2 = Gosu::Image.new(@tela, 'img/monstro2.png', true) 
    @vivo = true
    @y = rand(@tela.height) - @mons.height
    @ace = 0.1
    @velx = 2
    @vely = 2
    @x = 660
    @speed = @x - 10*4
	   @scream = Gosu::Sample.new(@tela, "mus/smp/crow.aif")
      @screamsound = @scream.play(vol = 1, speed = 1, looping = false)
  $s = 0
  $som = 0
  end

  def mover(tiro)
    
    
    if $s < 1000 then
      $s+=1
      end
      if $s == 1000 then
      $som+=1
      $s = 0
      end
      if $som >= 1000 then
      $som = 0
      end
    @screamsound
   
    
    
    
    
    
  
    @x = @x - @velx
    if @y > @tela.player.y
      @y -= @vely
    elsif @y < @tela.player.y
      @y += @vely
    end
    
    if @y > @tela.width
      @y = rand(@tela.width)
    end

    #if (@x <= 320) then
      @velx += @ace
    #end

   # levou?(tiro)
   #---------------------------------LEVELS LOGICA -------------------------------------------#
    if @tela.player.pontos > 200 and @tela.player.pontos < 400
        @ace = 0.2
        @tela.player.estagio = 2
    end
    
     if @tela.player.pontos > 400 and @tela.player.pontos < 600
         @ace = 0.3
          @tela.player.estagio = 3
     end
     if @tela.player.pontos > 600 and @tela.player.pontos < 1000
          @ace = 0.4
           @tela.player.estagio = 4
     end 
         
     if @tela.player.pontos > 1000 and @tela.player.pontos < 1400
           @ace = 0.6
           @tela.player.estagio = 5
      end
      
      if @tela.player.pontos > 1400 and @tela.player.pontos < 1600
        @ace = 0.8
        @tela.player.estagio = 6
      end
      
      if @tela.player.pontos > 1600 and @tela.player.pontos < 1800
        @ace = 1.0
        @tela.player.estagio = 7
      end
      
      if @tela.player.pontos > 1800 and @tela.player.pontos < 2000
        @ace = 1.2
        @tela.player.estagio = 8
      end
       if @tela.player.pontos > 2000 and @tela.player.pontos< 2200
        @ace = 1.4
        @tela.player.estagio = 9
      end
       if @tela.player.pontos > 2200 and @tela.player.pontos< 2400
        @ace = 1.6
        @tela.player.estagio = 10
      end
       if @tela.player.pontos > 2400 and @tela.player.pontos< 2600
        @ace = 1.8
        @tela.player.estagio = 11
      end
       if @tela.player.pontos > 2600
        @ace = 2.0
        @tela.player.estagio = 12
      end

      
  #------------------------------------------------------------------------------------#    
  if @tela.player.pontos
      
      
    if(@x <= -@mons.width)
      morrer
    end
  end
  
  def morrer
    @tela.bichos.delete(self)  
    @tela.player.pontos = @tela.player.pontos + 10
  
  end

  end
  def getpoints
    if
    self.x <= 0
    @tela.player.pontos = @tela.player.pontos + 10
    end
  end


  def draw
	 
    @mons.draw(@x, @y, 3)
	 
  end

  def levou?(tiro)
    if Gosu::distance(tiro.x, tiro.y, @x, @y) < 60
      morrer
    end
  end
end