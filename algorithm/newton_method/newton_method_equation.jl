using Plots, JLD

# Create test points
function generate_test_points(filename::String, data_length=150)
    y = zeros(Float64, data_length, 1)
    x = range(0, step=1, length=data_length)
    for i=1:data_length
        if i < 20
            y[i] = cos(i/10) + 0.5*rand()
        elseif i < 40
            y[i] = y[i-1]+0.01*i + 0.5*rand()
        elseif i < 60
            y[i] = y[i-1]-cos(i/10) + 0.5*rand()
        elseif i < 80
            y[i] = y[i-1]+0.25 + 0.5*rand()
        elseif i < 100
            y[i] = y[i-1] - cos(i/2) + 0.5*rand()
        else
            y[i] = y[i-1] - 0.005*(i-120)^2 + 0.1 + 0.5*rand()
        end
    end
    y .-= 10
    append_temp = ""
    for temp in y
        append_temp *= string(temp) * ","
    end
    # save the test data 
    save(filename, "testpoint", y)
end
generate_test_points("testpoint.jld")

# load the data
y = load("testpoint.jld", "testpoint")
plot(y, xlabel="x", ylabel="y", title="Test")

# implement the newton method
function newton_iter(x:: Float64)
    temp = convert(Int64, round(x, digits=0))
    return x - y[temp]/(y[temp]-y[temp-1])
end

data_length = length(y)
func_xy = Array{Float64, 2}(undef, data_length, 2)
x_yiszero = 0
START = 25.0
sol_collect = zeros(Float64, 100, 1)
for i=1:100
    global(x_yiszero)
    if i == 1
        # start
        x_yiszero = newton_iter(START)
    else
        x_yiszero = newton_iter(x_yiszero)
    end
    println("$i: $x_yiszero")
    sol_collect[i] = x_yiszero
end
answer = y[convert(Int64, round(w, digits=0))]
println("x= $x_yiszero, y[x]=0 answer is $answer")
plot(sol_collect, xlabel="iteration times", ylabel="y[x]", title="Find x result")

