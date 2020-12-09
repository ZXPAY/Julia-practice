run(`gcc -shared -o test.so test.c`)

dataSum = ccall((:add, "./test.so"), Int32, (Int32, Int32), 5, 19)
println(dataSum)

dataSumByPointer = Vector{Int32}(undef, 1)
ccall((:add3_p, "./test.so"), Cvoid, (Int32, Int32, Int32, Ptr{Int32}), 5, 19, 5, dataSumByPointer)
println(dataSumByPointer)


