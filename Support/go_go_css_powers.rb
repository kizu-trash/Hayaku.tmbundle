#*_*#

# for testing look at current support folder
require_support = ''
require_support = ENV['TM_BUNDLE_SUPPORT'] + '/' unless ENV['TM_BUNDLE_SUPPORT'].include? 'Ruby.tmbundle'

require require_support + 'ololo_dictionary.rb'


# oh hai, findfirster!
def findFirst( array, head, tail )
  array||= []
  
  result = array.select do |item|
    # now it can be a hash with name or just an array
    where = item
    where = item['name'] if item.class == Hash
    
    # lulz regexp and conditional tail
    true if where.gsub(/([a-z])([A-Z])/,'\1_\2') =~ Regexp.new('^' + head.split('').join('(\w*[-_])?') + '(?!\w*-)', true)\
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
    current = input.match(/([^\d\.]*[^\d\.-])(?:(-?\d*\.?\d+)(\w\w|%)?)?/)

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

        break if result['found']
      end
    end


    if result['found'] && result['found'][0]
      foundUnit = Props.select{ |item| item['name'] == result['found'][0] && item['units'] }[0]
      if current[2] && foundUnit
        dimension = case current[2]
          when '00'
            '100%'
          when '0'
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
  inputs = inputs.split(';').collect do |input|
    expanded = ParseAbbreviation(input)
    if expanded
      result = $ololo[0] + expanded['found'][0].downcase + ': ' # space move to config
      result += expanded['found'][1].downcase if expanded['found'][1]
      result += expanded['dimension']||'|'
      result += ';'
    end
  end
  if inputs[0]
    i = 0;
    inputs.collect{ |input| i+=1;input.gsub('|',"$#{i}")  }.join('
' )
  end
end

result = ExpandCSSAbbreviation(ENV['TM_CURRENT_LINE'].strip)

if result && result != ''
  print result
else
  print case ENV['TM_CURRENT_LINE']
  when /;$/
    ENV['TM_CURRENT_LINE'] + '
' + $ololo[0]
  when /^$/
    '	'
  when /^\s+$/
    ENV['TM_CURRENT_LINE'] + '	'
  else
    ENV['TM_CURRENT_LINE']
  end
end
