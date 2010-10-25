#*_*#

# for testing look at current support folder
require_support = ''
require_support = ENV['TM_BUNDLE_SUPPORT'] + '/' unless ENV['TM_BUNDLE_SUPPORT'].include? 'Ruby.tmbundle'

require require_support + 'ololo_dictionary.rb'
require require_support + 'parsing_parser.rb'
require require_support + 'variable_variables.rb'

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
  # another thing to move to config - inputs delimiter
  results = []
  any_ok = false
  inputs.split(/[; ]/).each do |input|
    expanded = ParseAbbreviation(input)
    
    if expanded
      result = $indent + expanded['found'][0].downcase + ':' + $syntax_space
      result += expanded['found'][1].downcase if expanded['found'][1]
      result += expanded['dimension']||''
      result += '$|' if !expanded['dimension'] && expanded['found'][1] == ''
      result += ' !important' if expanded['importance']
      result += ';'
      result = checkPrefixes(result,expanded['found'][0])
      
      results << result
      any_ok = true
    else
      results << $indent + '/* ' + input + " */"
    end
  end

  if results
    i = 0;
    results.collect! do |result|
      if result.include? '|'
         i+=1;
         result.gsub('|',"#{i}")
       else
         result
      end
    end
    
    results = results.join("\n" )
  end
  
  if any_ok
    return results
  else
    return nil
  end
  
end

result = ExpandCSSAbbreviation(ENV['TM_CURRENT_LINE'].strip)

if result && result != '' && !ENV['TM_CURRENT_LINE'].match(/(;|\*\/)\s*$/)
  print result
else
  print case ENV['TM_CURRENT_LINE']
  when /(;|\*\/)\s*$/
    ENV['TM_CURRENT_LINE'] + "\n" + $indent
  when /^\s*\}$/
    $before_closing + '}' + "\n"
  when /^\s*$/
    $syntax_tab
  else
    ENV['TM_CURRENT_LINE']
  end
end

# testing in ruby env
#p ExpandCSSAbbreviation('miw') if require_support == ''
