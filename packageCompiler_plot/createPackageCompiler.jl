using PackageCompiler
println("import Gadfly")
@time import Gadfly

println("Create Gadfly image")
create_sysimage(:Gadfly, sysimage_path="Gadfly.so", precompile_execution_file="precompile_file.jl")

println("\n =============== \n")

println("import Plots")
@time import Plots
println("Create Plots image")
create_sysimage(:Plots, sysimage_path="Plots.so")

println("import ControlSystems")
@time import ControlSystems
println("Create ControlSystems image")
create_sysimage(:ControlSystems, sysimage_path="ControlSystems.so")
