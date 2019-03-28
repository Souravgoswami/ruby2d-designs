#!/usr/bin/ruby -w
require 'ruby2d'
require 'securerandom'

@width, @height = 640, 480
set width: @width, height: @height, fps_cap: 900, resizable: true, background: '#000000'

on :key_down do |k| close if k.key == 'escape' end

particles_size, i = (particles = Array.new(1200) { Square.new(size: 2, color: "##{SecureRandom.hex(3)}", x: @width / 2 - 2, y: @height / 2 - 2)}).size, Math::PI

update do
	i -= 0.00001
	index = 0

	while index < particles_size do
		particle = particles[index]
		particle.x = Math.sin(index * i) * @width / 3.0 + @width / 2
		particle.y= Math.tan(index) * @height / 8.0 + @height / 2
		particle.color = "##{SecureRandom.hex(3)}"
		index += 1
	end
end

show
