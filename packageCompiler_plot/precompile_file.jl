using Gadfly, Cairo
image = plot(x=rand(100), y=rand(100))
draw(PNG("random.png", 6inch, 4inch), image)
