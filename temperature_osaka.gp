set xdata time
set timefmt "%Y-%m-%d"
set xrange ["2020-08-14":"2020-09-25"]

#
set xlabel "day"
set ylabel "Temperature / C"
set title "Temperature in Osaka"
#
set grid xtics ytics mxtics mytics
set grid lt -1, lt 0
set mxtics 7
set ytics 10
set mytics 5
#
set xdata time
set timefmt "%Y-%m-%d"
#
#set xtics "2008-12-7",7,"2009-1-10"

#
#set xrange ["2011-09-03":"2011-10-15"]
set yrange [-4:40]
set format x "%m/%d"
#
set term png giant size 600,400
set output "/Users/taisuke/temperature/osaka/temperature_osaka.png"
#
#--------------------------------------------------------
#set style line 1 lt 1 pt 7 lw 2 ps 1 lc rgb "#FF3333"
#set style line 2 lt 3 pt 7 lw 2 ps 1 lc rgb "#3333CC"
#set style line 3 lt 4 lw 1 lc rgb "#FF9944"
#set style line 4 lt 14 lw 1 lc rgb "#0066CC"
#--------------------------------------------------------
set style line 1 lt 1 lw 2 pt 5
set style line 2 lt 8 lw 2 pt 5
set style line 3 lt 13 lw 1
set style line 4 lt 15 lw 1
set style line 5 lt 11 lw 1
set key top right
#
plot \
"/Users/taisuke/temperature/osaka/temperature_osaka_past.log" using 1:2 title "Max ave" ls 3 lc rgb "red" with l , \
"/Users/taisuke/temperature/osaka/temperature_osaka_past.log" using 1:3 title "Min ave" ls 4 lc rgb "blue" with l, \
"/Users/taisuke/temperature/osaka/temperature_osaka_past.log" using 1:4 title "Last year" ls 5 lc rgb "light-magenta" with l , \
"/Users/taisuke/temperature/osaka/temperature_osaka_past.log" using 1:5 title "" ls 5 lc rgb "light-magenta" with l, \
"/Users/taisuke/temperature/osaka/temperature_osaka.log" using 1:3 title "Max" ls 1 lc rgb "red" with lp, \
"/Users/taisuke/temperature/osaka/temperature_osaka.log" using 1:2 title "Min" ls 2 lc rgb "blue" with lp
#
set term gif tiny
set term gif size 240,180
set output "/Users/taisuke/temperature/osaka/temperature_osaka.gif"
replot
