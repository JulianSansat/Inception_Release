class Weapons
	attr_reader :x, :y
	attr_accessor :x, :y
	def initialize(janela,x,y)
	@janela = janela
	@x = x
	@y = y
	@ammo = {"p228" => 13, "shotgun" => 7}
	@img = {"p228" => "media/armado.png"}
	end

	
	def draw
		#imagem= @img
		#imagem.draw_rot(@x, @y, 2, (@angulo += 1)%360)
	end
	
end	