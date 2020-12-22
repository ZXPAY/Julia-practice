using Gtk, Gtk.ShortNames

# Load the Glade file
ui = Builder(filename = "practice_ui.glade")

# load the ID "window1"
win = ui["window1"]

# global variable
count1 = 0
flag = false

# implement the button callback function
function button_clicked_callback(widget)
    global count1
    count1 += 1
    println("button click $count1")
    GAccessor.text(ui["label1"], "button click $count1")
end
function togglebutton_clicked_callback(widget)
    global flag
    flag ⊻= 1
    println("toggle button click $flag")
    GAccessor.text(ui["label1"], "toggle button click $flag")
end

# button callback function connect
signal_connect(button_clicked_callback, ui["button1"], "clicked")
signal_connect(togglebutton_clicked_callback, ui["togglebutton1"], "clicked")

# Start the GUI
showall(win)