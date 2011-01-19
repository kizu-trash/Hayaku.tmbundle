#*_*#

# for testing look at current support folder
require_support = ''
require_support = ENV['TM_BUNDLE_SUPPORT'] + '/' unless ENV['TM_BUNDLE_SUPPORT'].include? 'Ruby.tmbundle'

require require_support + 'ololo_dictionary.rb'
require ENV['TM_SUPPORT_PATH'] + '/lib/exit_codes.rb'

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
    result.gsub!(/([\w\-\.]*)‸([\w\-\.]*)/){
      ($1 + $2).gsub(/([\d\-\.]+)/){
        ($1.to_f + Modifier).to_s.gsub(/\.0$/,'')
      }
    }
    # place caret after replace
    result.insert(ENV['TM_LINE_INDEX'].to_i + result.length - ENV['TM_CURRENT_LINE'].length, '${0}')

    print result
    
  else
    TextMate.exit_discard
  end
end