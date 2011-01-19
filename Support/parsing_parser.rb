#*_*#

# oh hai, findfirster!
def findFirst( array, head, tail )
  array||= []

  stricter = ''
  stricter = '(?!\w*-)' if !array[0].is_a? String
  
  result = array.select do |item|
    # now it can be a hash with name or just an array
    where = item
    where = item['name'] if item.is_a? Hash
    
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
      filterShortcut(ValueShortCuts,foundTail0[0])
    ] if foundTail0[0] || tail == ''
  else
    [
      result[0]
    ]
  end
end

# Find property and value
def ParseAbbreviation( input )
  result = nil

  #find extras in input
  current = input.match(/([a-z\-\:\'\/]*[a-z])(?:(\-?\d*\.?\d+)(\w\w|%)?)?(!)?/) || ['','']


  if GlobalShortCuts[current[1]]
    result = {'found',GlobalShortCuts[current[1]]}
  else
    if current[1].index(/[\:\'\/]/) #soft find if there is a delimiter (btw move it to config)
      split = current[1].split(/[\:\'\/]/)
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
  end

  if result && result['found'] && result['found'][0]
    foundUnit = Props.select{ |item| item['name'] == result['found'][0] && item['units'] }[0]
    if current[2] && foundUnit
      dimension = if current[2] == '1' && !result['found'][0].match(/border|zoom/i) && !current[3]
          '100%'
        elsif current[2]== '0'
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
    elsif Props.select{ |item| item['name'] == result['found'][0] && item['units'].include?('px') && item['units'].include?('em') }[0]
      # Autounits for value
      result['dimension'] = '${|}${|/((?=.)[\d\-]*(\.)?(\d+)?$)?.*/(?1:(?2:(?3::0)em:px))/}'
    end
    result['importance'] = true if current[4]

    result      
  else
    result = nil
  end
end
