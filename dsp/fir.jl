using Plots, DSP

FIR_PARA = [0.25, 0.25, 0.25, 0.25]

# Simple FIR implement
function fir(input:: Array, para::Array)
    array_size = length(input)
    para_size = length(para)
    output = similar(input)
    for i=1:array_size
        if i > para_size
            output[i] = 0
            for j=1:para_size
                output[i] += para[j]*input[i-j]
            end
        else
            output[i] = input[i]
        end
    end
    return output
end

t = 0:0.001:2*2*pi
noise = rand(length(t))*0.1
test_sin = sin.(t) .+ noise
plot(t, test_sin)

@time test_output = fir(test_sin, FIR_PARA)
plot(t, test_output)
