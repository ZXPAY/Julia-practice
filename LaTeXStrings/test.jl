using LaTeXStrings
@time using Plots

println(L"\pi")
@time img = plot(rand(100), rand(100), seriestype=:scatter, title=L"gggg\pi \frac{1}{x^x}")
savefig(img, "test.png")
