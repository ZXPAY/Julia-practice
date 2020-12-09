println("Before load the sysimage")
run(`julia loadPackage.jl`)


print("\n\n")

println("After load the sysimage")
run(`julia --sysimage Gadfly.so loadPackage.jl`)

