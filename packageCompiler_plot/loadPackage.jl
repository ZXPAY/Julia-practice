# Load Gadfly package
__precompile__(true)
println("import Gadfly")
@time using Gadfly
import Cairo

println("==========================")

println("plot the random data")
@time image = plot(x=rand(100), y=rand(100))
println("Save the image")
@time temp = PNG("random.png", 6inch, 4inch)
@time draw(temp, image)

