@time using ControlSystems
@time using Plots

# Motor parameters
J = 2.0
b = 0.04
K = 1.0
R = 0.08
L = 1e-4

# Create the model transfer function
s = tf("s")
P = K/(s*((J*s + b)*(L*s + R) + K^2))
# This generates the system
# TransferFunction:
#                1.0
# ---------------------------------
# 0.0002s^3 + 0.160004s^2 + 1.0032s
#
#Continuous-time transfer function model

# Create an array of closed loop systems for different values of Kp
CLs = TransferFunction[kp*P/(1 + kp*P) for kp = [1, 5, 15]];

# Plot the step response of the controllers
# Any keyword arguments supported in Plots.jl can be supplied
img = stepplot(CLs, label=["Kp = 1" "Kp = 5" "Kp = 15"])
savefig(img, "test.png")
