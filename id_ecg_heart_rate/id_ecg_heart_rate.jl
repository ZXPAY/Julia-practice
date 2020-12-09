# import plot package
# using Gadfly, Cairo
# import statistics package
using Statistics

println("Open and read data")
# read raw data
f = open("log_1106_091828.txt", "r")
raw_data = readlines(f)
close(f)

# create array to save data
data_length = length(raw_data)
time_stamp = Array{Float32, 1}(undef, data_length)
ecg = Array{Float32, 1}(undef, data_length)

# save data to array
for i in 1: data_length
    d_line = raw_data[i]
    temp_split = split(d_line, ",")
    time_stamp[i] = parse(Float32, temp_split[1])
    ecg[i] = parse(Float32, temp_split[2])
end


# fg = plot(x=time_stamp[1:400], y=ecg[1:400], Geom.line)
# draw(PNG("ecg.png", 9inch, 6inch), fg)
# println("End")

println(typeof(ecg))
println("mean: $(mean(ecg))")
println("min: $(minimum(ecg))")
println("max: $(maximum(ecg))")


threshold = (mean(ecg) + maximum(ecg)) / 2
println("threshold: $(threshold)")
wait_tick = 0.025

last_tick = time_stamp[1]

for i in 1: data_length
    if ecg[i] > threshold
        global last_tick
        if time_stamp[i] - last_tick > wait_tick
            # println("$(time_stamp[i]), $(last_tick)")
            println("HR: $(60/(time_stamp[i] - last_tick))")
            last_tick = time_stamp[i]
        end
    end
end
