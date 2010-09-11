#*_*#

# for testing look at current support folder
require_support = ''
require_support = ENV['TM_BUNDLE_SUPPORT'] + '/' unless ENV['TM_BUNDLE_SUPPORT'].include? 'Ruby.tmbundle'

require require_support + 'ololo_dictionary.rb'
require require_support + 'parsing_parser.rb'

$indent = ENV['TM_CURRENT_LINE'].match(/\s+/) || ['']

# ahaha lol method!11
def ExpandCSSAbbreviation( inputs )
  # another thing to move to config - inputs delimiter
  results = []
  inputs.split(';').each do |input|
    expanded = ParseAbbreviation(input)
    
    if expanded
      result = $indent[0] + expanded['found'][0].downcase + ': ' # space move to config
      result += expanded['found'][1].downcase if expanded['found'][1]
      result += expanded['dimension']||'$|'
      result += ' !important' if expanded['importance']
      result += ';'
      
      results << result
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
    
    results.join("\n" )
  end
end

result = ExpandCSSAbbreviation(ENV['TM_CURRENT_LINE'].strip)

if result && result != ''
  print result
else
  print case ENV['TM_CURRENT_LINE']
  when /;$/
    ENV['TM_CURRENT_LINE'] + "\n" + $indent[0]
  when /^$/
    "\t"
  when /^\s+$/
    ENV['TM_CURRENT_LINE'] + "\t"
  else
    ENV['TM_CURRENT_LINE']
  end
end

# testing in ruby env
#p ExpandCSSAbbreviation('miw') if require_support == ''
