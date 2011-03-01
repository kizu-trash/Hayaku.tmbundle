#*_*#

# for testing look at current support folder
require_support = ''
require_support = ENV['TM_BUNDLE_SUPPORT'] + '/' unless ENV['TM_BUNDLE_SUPPORT'].include? 'Ruby.tmbundle'

require ENV['TM_SUPPORT_PATH'] + '/lib/exit_codes.rb'
require ENV['TM_SUPPORT_PATH'] + '/lib/escape.rb'
require require_support + 'ololo_dictionary.rb'
require require_support + 'parsing_parser.rb'
require require_support + 'variable_variables.rb'

@input = e_sn(STDIN.read)
def WTF(wut)
  TextMate.exit_show_tool_tip 'WTF: ' + wut
end

# check if there are prefixes for a result - move to parser
# TODO: last \n and indent must be obly if it's the last thing in abbreviation, so need to move it to outside someday
def checkPrefixes(input, where)
  result = ''
  foundPrefixes = Props.select{ |item| item['name'] == where && item['prefixes'] }[0]
  if foundPrefixes
    foundPrefixes['prefixes'].each do |prefix|
      result << input.gsub(/(\s*)(.+)/,'\1'+ prefix +'\2') + "\n"
    end
    result += $indent
  end
  result = input if result == ''
  return result
end

# ahaha lol method!11
def ExpandCSSAbbreviation( inputs )
  @results = []
  
  # Split input by properties delimiter
  inputs.split(/;|(\w+:\s*[^;]*)|(\/\*[^\/]*\*\/)|([^\s;{}]+)/).each do |input|
    @result = ''

    if !input.match(/./) or input.match(/[{}]|^\s+$|^\s*\/\*[^\/]*\*\/$/)
      @results << input
    else
      @expanded = ParseAbbreviation(input)
      
      if @expanded
        @result += @expanded['found'][0].downcase + ':' + $syntax_space if @expanded['found'][0]
        @result += @expanded['found'][1].downcase if @expanded['found'][1]
        @result += @expanded['dimension']||''
        @result += '$|' if !@expanded['dimension'] && @expanded['found'][1] == ''
        @result += ' !important' if @expanded['importance']
        @result += ';'
        @result = checkPrefixes(@result,@expanded['found'][0])

        @results << @result
      else
        @results << input
      end
    end
  end

  if @results
    i = 0;
    @results.collect! do |result|
      if result.include? '|'
         i+=1;
         result.gsub('|',"#{i}")
       else
         result
      end
    end
  end

  return @results.join()
end

result = ExpandCSSAbbreviation(@input)

if result && result != ''
  print result
else
  TextMate.exit_discard
end
