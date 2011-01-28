#*_*#
require ENV['TM_SUPPORT_PATH'] + '/lib/exit_codes.rb'

if ENV['TM_SELECTED_TEXT']
  TextMate.exit_discard
else
  # get left and right part from caret position
  left = ''
  left = ENV['TM_CURRENT_LINE'].slice(0..ENV['TM_LINE_INDEX'].to_i-1) if ENV['TM_LINE_INDEX'].to_i > 0
  right = ENV['TM_CURRENT_LINE'].slice(ENV['TM_LINE_INDEX'].to_i..-1)

  print (left + "‸" + right + '${0}').gsub(/([\{\;]?[^\;\}]*)‸([^\;\}]*[\}\;]?)/){
    if ($1 + $2).index('!important')
      if ($2).index(' !important')
        ($1 + "‸" + $2).sub('‸','${1}').gsub(' !important','')
      else
        ($1 + $2).gsub(/ ?!important/,'${1}')
      end
    else
      ($1 + "‸" + $2).sub(/(\s+‸)?\s*;?(\s*)$/){
        if $1
          ' ‸!important;' + $2
        else
          ' !important;' + $2
        end
      }.sub(/‸/,'${1}')
    end
  }
end