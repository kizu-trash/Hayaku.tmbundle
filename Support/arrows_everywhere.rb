#*_*#

# for testing look at current support folder
require_support = ''
require_support = ENV['TM_BUNDLE_SUPPORT'] + '/' unless ENV['TM_BUNDLE_SUPPORT'].include? 'Ruby.tmbundle'

require require_support + 'ololo_dictionary.rb'
require ENV['TM_SUPPORT_PATH'] + '/lib/exit_codes.rb'
require ENV['TM_SUPPORT_PATH'] + '/lib/escape.rb'

if ENV['TM_SELECTED_TEXT']
  if ENV['TM_SELECTED_TEXT'].index(/^[\d\-\.]+$/)
    print "${0:"+ (ENV['TM_SELECTED_TEXT'].to_f + Modifier).to_s.gsub(/\.0$/,'') +"}"
  else
    TextMate.exit_discard
  end
else
  # get left and right part from caret position
  left = ''
  left = ENV['TM_CURRENT_LINE'].slice(0..ENV['TM_LINE_INDEX'].to_i-1) if ENV['TM_LINE_INDEX'].to_i > 0
  right = ENV['TM_CURRENT_LINE'].slice(ENV['TM_LINE_INDEX'].to_i..-1)

  if ENV['TM_CURRENT_WORD'].index(/\d/)
    # mark caret position for digit find
    result = left + "‸" + right
    if result.match(/(^|(?!\d)\w)‸((?:(?!\d)\w)*)(-?\d*\.?\d+|\d+(?:\.\d+)?)/)
      # if the caret is before number
      result.gsub!(/(^|(?!\d)\w)‸((?:(?!\d)\w)*)(-?\d*\.?\d+|\d+(?:\.\d+)?)/){
        $1 + $2 + ($3.to_f + Modifier).to_s.gsub(/\.0$/,'')
      }
    elsif result.match(/(-?\d*\.?\d+|\d+(?:\.\d+)?)((?:(?!\d)\w)*)‸($|(?!\d)\w)/)
      # if the caret is after number
      result.gsub!(/(-?\d*\.?\d+|\d+(?:\.\d+)?)((?:(?!\d)\w)*)‸((?!\d)\w|$)/){
        found = [$1,$2||'',$3||'']
        (found[0].to_f + Modifier).to_s.gsub(/\.0$/,'') + found[1] + found[2]
      }
    else
      # if the caret is in middle of number
      # need refactoring (
      result.gsub!(/([\w\-\.]*)‸([\w\-\.]*)/){
        ($1 + $2).gsub(/([\d\-\.]+)/){
          ($1.to_f + Modifier).to_s.gsub(/\.0$/,'')
        }
      }
    end
    # place caret after replace
    jumpIndex = ENV['TM_LINE_INDEX'].to_i + result.length - ENV['TM_CURRENT_LINE'].length
    jumpIndex = 0 if jumpIndex < 0
    result.insert(jumpIndex, '⦉${0}⦊')

    print e_sn(result).gsub('⦉\${0}⦊','${0}')
    
  else
    TextMate.exit_discard
  end
end