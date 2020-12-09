#=
@file: read_write_file.jl
@date: 2020/11/11
@author: Danny
@brief: Test IO file
=#
# write and read
# reference: https://docs.julialang.org/en/v1/base/io-network/

FILE_NAME = "test.txt"

# write file, replace
f = open(FILE_NAME, "w")
write(f, "Hello world !!!\n")
close(f)

# append file
f = open(FILE_NAME, "a")
for cnt in 0:10
    write(f, string(cnt))
    write(f, "\n")
end
close(f)

# read file
println("Read text file")
f = open(FILE_NAME, "r")
data = read(f, String)
print(data)
close(f)

#=========================================#
# write bytes file
BYTE_FILE = "byte_file"
f = open(BYTE_FILE, "w")
write(f, Char(0x53))
write(f, Char(0))
write(f, Char(0x25))
close(f)

# read bytes file
println("Read byte file")
f = open(BYTE_FILE, "r")
rec = read(f, 3)
println("type is $(typeof(rec))")
println("length is $(length(rec))")
println(rec)
close(f)


