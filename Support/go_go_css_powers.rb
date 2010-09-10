#*_*#

# for testing look at current support folder
require_support = ''
require_support = ENV['TM_BUNDLE_SUPPORT'] + '/' unless ENV['TM_BUNDLE_SUPPORT'].include? 'Ruby.tmbundle'

require require_support + 'ololo_dictionary.rb'


# oh hai, findfirster!
def findFirst( array, head, tail )
  array||= []
  
  stricter = ''
  stricter = '(?!\w*-)' if array[0].class != String
  
  result = array.select do |item|
    # now it can be a hash with name or just an array
    where = item
    where = item['name'] if item.class == Hash
    
    # lulz regexp and conditional tail
    true if where.gsub(/([a-z])([A-Z])/,'\1_\2') =~ Regexp.new('^' + head.split('').join('(\w*[-_])?') + stricter, true)\
      && (tail == '' || findFirst(item['values'],tail,''))
  end
  # we return an array, maybe make a class instead, make all the upper stuff at init and get .prop or .value just when needed?
  # or maybe move it to a richer class as a method, so we'd not make any results, but setting attrs of this class lol

  foundTail0 = findFirst(result[0]['values'],tail,'') if result[0] && tail != ''
  foundTail0||=['']
  if result[0].class == Hash
    [
      result[0]['name'],
      foundTail0[0]
    ] if foundTail0[0] || tail == ''
  else
    [
      result[0]
    ]
  end
end

# Find property and value
def ParseAbbreviation( input )
  # If there is a shortcut - use it
  if ShortCuts[input]
    ShortCuts[input]
  else
    result = nil

    #find extras in input
    current = input.match(/([^\d\.!]*[^\d\.\-!])(?:(\-?\d*\.?\d+)(\w\w|%)?)?(!)?/)

    if current[1].include? ':' #soft find if there is a delimiter (btw move it to config)
      split = current[1].split(':')
      result = {'found',findFirst(Props,split[0],split[1])}
    else 
      current[1].split('').each_index do |index|
        split = [
          current[1][0,index+1],
          current[1][index+1,current[1].length]
        ]
        result = {'found',findFirst(Props,split[0],split[1])}

        break if result['found'] && result['found'][0]
      end
    end


    if result['found'] && result['found'][0]
      foundUnit = Props.select{ |item| item['name'] == result['found'][0] && item['units'] }[0]
      if current[2] && foundUnit
        dimension = case current[2]
          when '1' # create a Dict option for it 'cause there are borders and other stuff for it
            '100%'
          when '0' # again - create a Dict option, however it's not that bad ad prev
            '0'
          else
            current[2] +
            if current[3]
              current[3]
            else
              if current[2].include? '.'
                'em'
              else
                foundUnit['units'][0]
              end
            end
          end
        result['dimension'] = dimension if dimension
      end
      result['importance'] = true if current[4]

      result      
    else
      result = nil
    end
    
  end
end

$ololo = ENV['TM_CURRENT_LINE'].match(/\s+/) || ['']

# ahaha lol method!11
def ExpandCSSAbbreviation( inputs )
  # another thing to move to config - inputs delimiter
  results = []
  inputs.split(';').each do |input|
    expanded = ParseAbbreviation(input)
    
    if expanded
      result = $ololo[0] + expanded['found'][0].downcase + ': ' # space move to config
      result += expanded['found'][1].downcase if expanded['found'][1]
      result += expanded['dimension']||'|'
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
         result.gsub('|',"$#{i}")
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
    ENV['TM_CURRENT_LINE'] + "\n" + $ololo[0]
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
