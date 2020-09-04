#!/bin/sh
pos=osaka
tp=/Users/taisuke/temperature/${pos}
rp=/Users/taisuke/src/ruby
/bin/rm ${tp}/'yesterday-62078.html'
/bin/rm ${tp}/'temperature_osaka.gp'
/opt/local/bin/wget -a ${tp}/wget.log -O ${tp}/yesterday-62078.html "http://www.jma.go.jp/jp/amedas_h/yesterday-62078.html?areaCode=000&groupCode=45"
/opt/local/bin/ruby -Ku ${rp}/tempura.rb ${tp}/yesterday-62078.html >> ${tp}/temperature_${pos}.log
${rp}/xrange.rb > ${tp}/temperature_${pos}.gp
/bin/cat ${tp}/graph_${pos}.gp >> ${tp}/temperature_${pos}.gp
/opt/local/bin/gnuplot ${tp}/temperature_${pos}.gp
/bin/cp ${tp}/temperature_${pos}.png /Users/taisuke/imgs/2008/
/bin/cp ${tp}/temperature_${pos}.gif /Users/taisuke/imgs/2008/
