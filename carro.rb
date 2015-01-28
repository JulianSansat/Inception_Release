class Carro
	attr_reader :x, :y, :chaves, :gasolina, :bateria
	attr_accessor :x, :y, :chaves, :gasolina, :bateria
	def initialize(janela)
		@janela = janela
		@x = 2562
		@y = 1500
		@angulo = 0
		@imagens = Gosu::Image.new(@janela,"media/carro.png", true)
		@chaves = false
		@gasolina = false
		@bateria = false
	end

	
	def draw
		imagem= @imagens
		imagem.draw_rot(@x, @y, 2, @angulo)
	end
	
	def move
		@y += 2
	end
end	
class Chaves
	attr_reader :x, :y
	attr_accessor :x, :y
	def initialize(janela, x, y)
		@janela = janela
		@x = x
		@y = y
		@angulo = 0
		@imagens = Gosu::Image.new(@janela,"media/keys.png", true)
	end

	
	def draw
		imagem= @imagens
		imagem.draw_rot(@x, @y, 2, @angulo)
	end
	

end

class Gas
	attr_reader :x, :y
	attr_accessor :x, :y
	def initialize(janela, x, y)
		@janela = janela
		@x = x
		@y = y
		@angulo = 0
		@imagens = Gosu::Image.new(@janela,"media/gas.png", true)
	end

	
	def draw
		imagem= @imagens
		imagem.draw_rot(@x, @y, 2, @angulo)
	end
	

end

class Battery
	attr_reader :x, :y
	attr_accessor :x, :y
	def initialize(janela, x, y)
		@janela = janela
		@x = x
		@y = y
		@angulo = 0
		@imagens = Gosu::Image.new(@janela,"media/battery.png", true)
	end

	
	def draw
		imagem= @imagens
		imagem.draw_rot(@x, @y, 2, @angulo)
	end
	

end

class Msg
	def initialize(janela, x, y)
	@font = Gosu::Font.new(janela, Gosu::default_font_name, 20)
	@x = x
	@y = y
	end
	
	def draw
		@font.draw("Precisa de Chaves e Gasolina", @x, @y, 10, factor_x = 1, factor_y = 1, color = 0xffff0000, mode = :default)
	end
end

class Msg2
	def initialize(janela, x, y)
	@font = Gosu::Font.new(janela, Gosu::default_font_name, 20)
	@x = x
	@y = y
	end
	
	def draw
		@font.draw("Precisa de Bateria", @x, @y, 10, factor_x = 1, factor_y = 1, color = 0xffff0000, mode = :default)
	end
end