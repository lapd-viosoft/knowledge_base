# gnuplot

# Get help for a command
help command 

# Load a gnuplot script
load 'script.plt'

# Save a gnuplot script
save 'script.plt'

# Set X axis label
set xlabel "asse x"

# Set Y axis label
set ylabel "asse y"

# Set title
set title "titolo"

# Set X axis range
set xrange [0:5]

# Set Y axis range
set yrange [0:5]

# Set autoscale
set autoscale

# Disable legend
unset key

# Position legend in top left
set key top left                     ;; we can use top|bottom right|left

# Plot a function
plot sin(x)
splot cos(x*y)                        ;; this is a 3D plot

# Plot multiple functions on same window
plot sin(x), cos(x)

# Function Definition and plot
f(x) = a * sin(b*x) * exp(-x/c) + d*x**2
;; set constant values
a=1.5; b=4.5; c=2.; d=0.45
pl f(x)


# Plot with log axes
set logscale                             ;; Plot using both log-axes
unset logscale; set logscale y           Plot using log-axes on y-axis

# Set X label tics
set xtics (0.002,0.004,0.006,0.008)      Change the tic-marks
unset xtics; set xtics auto              Return to the default tics


# Set background color to white
set terminal svg enhanced background rgb 'white'
