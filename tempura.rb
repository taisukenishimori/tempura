#!/bin/sh
# encoding: utf-8
exec ruby -S -x $0 "$@"
#! ruby

filename = ARGV[0]
_max_temperature = -100.0
_min_temperature = 100.0
_flag_max_temp = false
_flag_min_temp = false


file = open( filename ) # to open the JMA HTML file.
while text_buf = file.gets do

  if _flag_max_temp == true
    # text_bufから最高気温を切り出して、最高気温の値を代入する

    # <td class="td_arrange top">21.6</td>
    /<(.+)>(.+)<(.+)>/ =~ text_buf
    if "&nbsp;" == $2.to_s
	_max_temperature = 50.0
    elsif $2.to_f < 50 && $2.to_f > -10
	_max_temperature = $2.to_f
    else 
	_max_temperature = 50.0
    end
    _flag_max_temp = false
  end

  if  _flag_min_temp == true
    /<(.+)>(.+)<(.+)>/ =~ text_buf
    if "&nbsp;" == $2.to_s
	_min_temperature = -10
    elsif $2.to_f < 50 && $2.to_f > -10
	_min_temperature = $2.to_f
    else 
	_min_temperature = -10.0
    end
    _flag_min_temp = false
  end


  case text_buf
  when /<title>(.+)年(.+)月(.+)日/ # to find the date.
    printf( "%4d-%02d-%02d ", $1.to_i, $2.to_i, $3.to_i ) # print out the date. ex) 2008-11-04
    
  when /最高気温\(℃\)/ # to find the max temp in the day.
    _flag_max_temp = true

  when /最低気温\(℃\)/ # to find the min temp in the day.
    _flag_min_temp = true

  end
end
  
printf("%.1f %.1f\n", _min_temperature, _max_temperature ) # print out the max/min temp.
file.close
