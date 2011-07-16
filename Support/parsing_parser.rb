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
    elsif Props.select{ |item| item['name'] == result['found'][0] && result['found'][1] == '' && item['units'] && item['units'].include?('px') && item['units'].include?('em') }[0]
      # Autounits for value
      result['dimension'] = '${|}${|/((?!^0$)(?=.)[\d\-]*(\.)?(\d+)?$)?.*/(?1:(?2:(?3::0)em:px))/m}'
    elsif result['found'][0] && (result['found'][0].index(/-?color$/) or result['found'][0].downcase == 'background')
      # Again, hardcoded autounits for colors
      result['dimension'] =
        '${|/^(?=((\d{1,3}%?),(\.)?(.+)?$)?).+$/(?1:rgba\((?3:$2,$2,))/m}' + # Rgba start
        '${|/^(?=(\((.+)?$)?).+$/(?1:rgba)/m}' + # Alternate rgba start
        '${|/^(?=([0-9a-fA-F]{1,6}$)?).+$/(?1:#)/m}' + # If in need of hash
        '${|}' + # initial tabstop
        '${|/^(#?([0-9a-fA-F]{1,2})$)?.*/(?1:(?2:$2$2))/m}' + # Hex Digit multiplication
        '${|/^(?=((\d{1,3}%?),(\.)?(.+)?$)?).+$/(?1:(?3:(?4::5):(?4::$2,$2,1))\))/m}' # Rgba end
    end
    
    # Autocomplete
    if result['found'][1].length == 0 and (!result['dimension'] or result['dimension'].include?'|')
      foundValues = valuesOf(result['found'][0])
      if foundValues
        splitLefts = []
        splitRights = []
        foundValues.each do |value| # with adding of inherit
          value.downcase!
          if value.length > 1
           for i in 1..value.length-1 # need to use only first N chars if there'd be some perfomance problems
              if !splitLefts.include? value[0,i]
                splitLefts.push Regexp.escape(value[0,i]).gsub(/\\([- ])/,'\1')
                splitRights.push Regexp.escape(value[i,value.length]).gsub(/\\([- ])/,'\1')
              end
            end
          end
        end
        # generating autocomplete snippet from found pairs
        splitLefts.collect!{|x| '('+x+'$)?'}
        splitRights = splitRights.each_with_index.collect{|x,i| '(?'+(i+1).to_s+':'+x+')'}
        result['autocomplete'] = '${|/^' + splitLefts.join('') + '.*/' + splitRights.join('') + '/m}'
      end
    end
    result['importance'] = true if current[4]

    result
  else
    result = nil
  end
end
