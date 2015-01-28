require 'gosu'
require 'bullet'
require 'game'

class Jogador
  attr_reader :x,:y,:angulo, :vel_x, :vel_y, :vivo, :hits, :weapon, :bang, :som_tiro, :weapon_delay, :weapon_damage, :veiculo,:jogador, :estado
  attr_accessor :x, :y, :angulo, :vel_x, :vel_y, :ammo, :vivo, :hits, :weapon, :som_tiro, :weapon_delay, :weapon_damage, :veiculo, :estado
  def initialize(janela)
	@janela = janela
    @veiculo = "pe"
	@estado = "normal"
	@jogador = Gosu::Image::load_tiles(@janela, "media/armado_5.png", 50, 50, false)
	@jogador_arab = Gosu::Image::load_tiles(@janela, "media/armado_arabe.png", 50, 50, false)
    @cur_image = @jogador[0]
	@cur_image2 = @jogador_arab[0]
	@x = 1300
	@y = @janela.height/2
    @angulo = 0.0
	@vel_x = 0
	@vel_y = 0
	@weapon = "p228"
	@weapon_delay = 1
	@weapon_damage = 1
	@weapon_img = "media/m3.bmp"
	@weapon_image = Gosu::Image.new(@janela, @weapon_img, true) 
	@car_img = Gosu::Image.new(@janela, "media/carro.png", true)
	@cortar_img = [@jogador[9],@jogador[10],@jogador[11],@jogador[3]]
	@ammo = 13
	@vivo = true
	@hits = 0
	@som_tiro = "media/p228.wav"
	@bang = Gosu::Sample.new(janela, @som_tiro)
  end
  
  def draw(mapa)
	if(mapa == 'deserto' && self.estado == "normal")
		image = @cur_image2
		image.draw_rot(@x, @y, 5, @angulo)
	elsif(mapa != 'deserto' && self.estado == "normal")
		image = @cur_image
		image.draw_rot(@x, @y, 5, @angulo)
	end	
  end
  
  
  def parado(mapa)
	if(mapa == 'deserto' && self.estado == "normal")
		@cur_image2 = @jogador_arab[0]
	elsif(mapa != 'deserto' && self.estado == "normal")
		@cur_image = @jogador[0]
	end
  end

  
  def updateImg(mapa)
	if(self.vivo == true && mapa == 'deserto')
	@cur_image2 = @jogador_arab[Gosu::milliseconds / 100 % 6]
	elsif(self.vivo == true && mapa != 'deserto')
	@cur_image = @jogador[Gosu::milliseconds / 100 % 6]
	end
  end
	
  def mirar(mapa)
	if(self.vivo == true && mapa == 'deserto')
		if(self.weapon == "p228")
			@cur_image2 = @jogador_arab[6]
		elsif(self.weapon == "shotgun" && self.veiculo == "pe")
			@cur_image2 = @jogador_arab[8]
		elsif(self.weapon == "machete" && self.veiculo == "pe")
			@cur_image2 = @jogador_arab[9]
		end	
	elsif(self.vivo == true && mapa != 'deserto')
		if(self.weapon == "p228")
			@cur_image = @jogador[6]
		elsif(self.weapon == "shotgun" && self.veiculo == "pe")
			@cur_image = @jogador[8]
		elsif(self.weapon == "machete" && self.veiculo == "pe")
			@cur_image = @jogador[9]
		end	
	end
  end

  def atirar
	if(self.weapon != "machete")
		@bang.play
		self.ammo -= 1
	else
		@cur_image = @jogador[11]
	end
  end
  
  def cortar
	@estado = "cortando"
  end
  
  def mover_frente
	if(self.vivo == true && self.veiculo == "pe")
	@vel_x = Gosu::offset_x(@angulo, 2.7)
	@vel_y = Gosu::offset_y(@angulo, 2.7)
	@x += @vel_x
	@y += @vel_y
	elsif(self.vivo == true && self.veiculo == "car")
	@vel_x += Gosu::offset_x(@angulo, 0.5)
	@vel_y += Gosu::offset_y(@angulo, 0.5)
	end
  end	
  
  def mover_tras
	if(self.vivo == true)
	@x -= Gosu::offset_x(@angulo, 2.0)
	@y -= Gosu::offset_y(@angulo, 2.0)
	elsif(self.vivo == true && self.veiculo == "car")
	@vel_x -= Gosu::offset_x(@angulo, 0.2)
	@vel_y -= Gosu::offset_y(@angulo, 0.2)
	end
  end
  
  def girar_direita
	if(self.vivo == true)
		@angulo += 4.0
	end	
  end
  
  def girar_esquerda
	if(self.vivo == true)
		@angulo -= 4.0
	end	
  end
  
  def atrito
	if(self.veiculo == "car" && @janela.colisao_jogador(self.x,self.y,true) == false)
		self.x += self.vel_x
		self.y += self.vel_y
		self.vel_x *= 0.95
		self.vel_y *= 0.95
	end
  end
  
  def current_weapon
	if(self.weapon == "p228")
		self.som_tiro = "media/p228.wav"
		self.weapon_delay = 0.4
		self.weapon_damage = 1
	elsif(self.weapon == "shotgun")
		self.som_tiro = "media/m3.wav"
		self.weapon_delay = 0.8
		self.weapon_damage = 3
	end
	@bang = Gosu::Sample.new(@janela, @som_tiro)
  end

end

class Blood
attr_reader :x, :y, :cur_image,:blood
attr_accessor :x, :y, :cur_image,:blood
	def initialize(janela,x,y,angulo)
	@janela = janela
	@x = x
	@y = y
	@angulo = angulo
	@blood = Gosu::Image::load_tiles(@janela, "media/blood.png", 100, 100, true)
	@cur_image = @blood[0]
	end
	
	def draw
	@cur_image = @blood[Gosu::milliseconds / 50 % @blood.size]
	image = @cur_image
	image.draw_rot(@x, @y, 10, @angulo)	
	end
	
end
