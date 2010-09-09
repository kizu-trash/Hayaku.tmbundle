#*_*#
Commons = {
  'overflow' =>
  [
		'scroll',
		'visible',
		'hidden',
		'auto'
  ],
	'borderStyle' =>
	[
		'solid',
		'none',
		'daShed',
		'doTted',
		'doUble',
		'doT-daSh',
		'doT-doT-daSh',
		'hidden',
		'groove',
		'ridge',
		'inset',
		'outset'
	],
	'lengths' =>
	[
		'px',
		'em',
		'ex',
		'%',
		'in',
		'cm',
		'mm',
		'pt',
		'pc'
	]
}

Props = [
	{
		'name' => 'margin-top',
		'values' =>
    [
      'auto',
		],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'margin-right',
		'values' =>
    [
      'auto',
		],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'margin-bottom',
		'values' =>
    [
      'auto',
		],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'margin-left',
		'values' =>
    [
      'auto',
		],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'margin',
		'values' =>
    [
      'auto',
		],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'padding',
		'units' => Commons['lengths'],
	},
	{
		'name' => 'padding-top',
		'units' => Commons['lengths'],
	},
	{
		'name' => 'padding-right',
		'units' => Commons['lengths'],
	},
	{
		'name' => 'padding-bottom',
		'units' => Commons['lengths'],
	},
	{
		'name' => 'padding-left',
		'units' => Commons['lengths'],
	},
	{
		'name' => 'position',
		'values' =>
		[
			'static',
			'relative',
			'absolute',
			'fixed',
		]
	},
	{
		'name' => 'top',
		'values' => ['auto'],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'right',
		'values' => ['auto'],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'bottom',
		'values' => ['auto'],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'left',
		'values' => ['auto'],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'z-index',
		'values' => ['auto']
	},
	{
		'name' => 'float',
		'values' =>
		[
			'left',
			'right',
			'none',
		]
	},
	{
		'name' => 'clear',
		'values' =>
		[
			'left',
			'right',
			'both',
			'none',
		]
	},
	{
		'name' => 'display',
		'values' =>
		[
			'inline',
			'block',
			'list-item',
			'run-in',
			'inline-block',
			'comPact',
			'taBle',
			'inline-taBle',
			'taBle-row-group',
			'taBle-header-group',
			'taBle-footer-group',
			'taBle-row',
			'taBle-cell',
			'taBle-coLumn-group',
			'taBle-coLumn',
			'taBle-caPtion',
			'none',
		]
	},
	{
		'name' => 'visibility',
		'values' =>
		[
			'visible',
			'hidden',
			'collapse'
		]		
		
	},
	{
		'name' => 'overflow',
		'values' => Commons['overflow']
	},
	{
		'name' => 'overflow-x',
		'values' => Commons['overflow']
	},
	{
		'name' => 'overflow-y',
		'values' => Commons['overflow']
	},
	{
		'name' => 'overflow-style',
		'values' =>
		[
			'auto',
			'scrollbar',
			'panner',
			'move',
			'marQuee',
		]
	},
	{
		'name' => 'zoom',
	},
	{
		'name' => 'cliP',
		'values' =>
		[
			'rect(0 0 0 0)',
			'auto'
		]
	},
	{
		'name' => 'width',
		'values' =>
		[
			'auto',
		],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'height',
		'values' =>
		[
			'auto',
		],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'max-width',
		'values' =>
		[
			'none',
		],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'max-height',
		'values' =>
		[
			'none',
		],
		'units' => Commons['lengths'],
	},
	{
		'name' => 'min-width',
		'units' => Commons['lengths'],
	},
	{
		'name' => 'min-height',
		'units' => Commons['lengths'],
	},
	{
		'name' => 'outline',
		'values' =>
		[
			'none',
		]
	},
	{
		'name' => 'outline-offset',
	},
	{
		'name' => 'outline-width',
	},
	{
		'name' => 'outline-style',
	},
	{
		'name' => 'outline-color',
	},
	{
		'name' => 'borDer',
	},
	{
		'name' => 'borDer-top',
	},
	{
		'name' => 'borDer-right',
	},
	{
		'name' => 'borDer-bottom',
	},
	{
		'name' => 'borDer-left',
	},
	{
		'name' => 'borDer-color',
	},
	{
		'name' => 'borDer-style',
		'values' => Commons['borderStyle']
	},
	{
		'name' => 'borDer-width',
	},
	{
		'name' => 'borDer-break',
	},
	{
		'name' => 'borDer-collapse',
	},
	{
		'name' => 'borDer-image',
	},
	{
		'name' => 'borDer-fit',
	},
	{
		'name' => 'borDer-lengTh',
		'values' =>
		[
			'auto'
		]
	},
	{
		'name' => 'borDer-spacing',
	},
	{
		'name' => 'borDer-radius',
	},
	{
		'name' => 'borDer-top-image',
	},
	{
		'name' => 'borDer-right-image',
	},
	{
		'name' => 'borDer-bottom-image',
	},
	{
		'name' => 'borDer-left-image',
	},
	{
		'name' => 'borDer-corner-image',
	},
	{
		'name' => 'borDer-top-left-image',
	},
	{
		'name' => 'borDer-top-right-image',
	},
	{
		'name' => 'borDer-bottom-right-image',
	},
	{
		'name' => 'borDer-bottom-left-image',
	},
	{
		'name' => 'borDer-top-width',
	},
	{
		'name' => 'borDer-top-style',
		'values' => Commons['borderStyle']
	},
	{
		'name' => 'borDer-top-color',
	},
	{
		'name' => 'borDer-right-width',
	},
	{
		'name' => 'borDer-right-style',
		'values' => Commons['borderStyle']
	},
	{
		'name' => 'borDer-right-color',
	},
	{
		'name' => 'borDer-bottom-width',
	},
	{
		'name' => 'borDer-bottom-style',
		'values' => Commons['borderStyle']
	},
	{
		'name' => 'borDer-bottom-color',
	},
	{
		'name' => 'borDer-left-width',
	},
	{
		'name' => 'borDer-left-style',
		'values' => Commons['borderStyle']
	},
	{
		'name' => 'borDer-left-color',
	},
	{
		'name' => 'borDer-top-right-radius',
	},
	{
		'name' => 'borDer-top-left-radius',
	},
	{
		'name' => 'borDer-bottom-right-radius',
	},
	{
		'name' => 'borDer-bottom-left-radius',
	},
	{
		'name' => 'backGround',
		'values' =>
		[
			'none'
		]
	},
	{
		'name' => 'backGround-color',
		'values' =>
		[
			'transparent'
		]
	},
	{
		'name' => 'backGround-image',
		'values' =>
		[
			'url()',
			'none'
		]
	},
	{
		'name' => 'backGround-repeat',
		'values' =>
		[
			'repeat',
			'repeat-x',
			'repeat-y',
			'no-repeat',
		]
	},
	{
		'name' => 'backGround-attachment',
		'values' =>
		[
			'fixed',
			'scroll',
		]
	},
	{
		'name' => 'backGround-position',
	},
	{
		'name' => 'backGround-position-x',
	},
	{
		'name' => 'backGround-position-y',
	},
	{
		'name' => 'backGround-break',
		'values' =>
		[
			'bounding-box',
			'each-box',
			'continuous',
		]
	},
	{
		'name' => 'backGround-clip',
		'values' =>
		[
			'border-box',
			'padding-box',
			'content-box',
			'no-clip',
		]
	},
	{
		'name' => 'backGround-origin',
	},
	{
		'name' => 'backGround-siZe',
		'values' =>
		[
			'auto',
			'contain',
			'cover',
		]
	},
	{
		'name' => 'boX-siZing',
		'values' =>
		[
			'content-box',
			'border-box'
		]
	},
	{
		'name' => 'boX-shadow',
		'values' =>
		[
			'none',
			'border-box'
		]
	},
	{
		'name' => 'color',
	},
	{
		'name' => 'taBle-layout',
		'values' =>
		[
			'auto',
			'fixed'
		]
	},
	{
		'name' => 'caPtion-side',
		'values' =>
		[
			'top',
			'bottom'
		]
	},
	{
		'name' => 'empty-cells',
		'values' =>
		[
			'show',
			'hide'
		]
	},
	{
		'name' => 'list-style',
		'values' =>
		[
			'none'
		]
	},
	{
		'name' => 'list-style-position',
		'values' =>
		[
			'inside',
			'outside'
		]
	},
	{
		'name' => 'list-style-type',
		'values' =>
		[
			'none',
			'disc',
			'circle',
			'square',
			'deCimal',
			'deCimal-leading-zero',
			'lower-roman',
			'upper-roman',
		]
	},
	{
		'name' => 'list-style-image',
		'values' =>
		[
			'none'
		]
	},
	{
		'name' => 'cursor',
		'values' =>
		[
			'auto',
			'default',
			'crosshair',
			'hand',
			'help',
			'move',
			'pointer',
			'text',
		]
	},
	{
		'name' => 'quotes',
		'values' =>
		[
			'none'
		]
	},
	{
		'name' => 'conTent',
		'values' =>
    [
      'normal',
			'open-quote',
			'no-open-quote',
			'close-quote',
			'no-close-quote',
			'attr()',
			'counter()',
			'counterS()',
		]
	},
	{
		'name' => 'counter-increment',
	},
	{
		'name' => 'counter-reset',
	},
	{
		'name' => 'vertical-align',
		'values' =>
    [
      'sub',
			'super',
			'top',
			'text-top',
			'middle',
			'bottom',
			'baseLine',
			'text-bottom'
		]
	},
	{
		'name' => 'text-align',
		'values' =>
    [
      'left',
			'right',
			'center',
			'justify'
		]
	},
	{
		'name' => 'text-align-last',
		'values' =>
    [
      'left',
			'right',
			'center',
			'auto'
		]
	},
	{
		'name' => 'text-decoration',
		'values' =>
    [
      'none',
			'overline',
			'line-through',
			'underline'
		]
		
	},
	{
		'name' => 'text-emphasis',
		'values' =>
    [
      'none',
			'accent',
			'doT',
			'circle',
			'diSc',
			'before',
			'after',
		]
	},
	{
		'name' => 'text-height',
		'values' =>
    [
      'auto',
			'font-size',
			'text-size',
			'max-size'
		]
	},
	{
		'name' => 'text-indent',
		'values' =>
    [
      '-9999px',
		]
	},
	{
		'name' => 'text-justify',
		'values' =>
    [
      'auto',
			'inter-word',
			'inter-ideograph',
			'inter-cluster',
			'distribute',
			'kashida',
			'tibetan',
		]
	},
	{
		'name' => 'text-outline',
		'values' =>
    [
      'none',
		]
	},
	{
		'name' => 'text-replace',
		'values' =>
    [
      'none',
		]
	},
	{
		'name' => 'text-transform',
		'values' =>
    [
      'none',
			'uppercase',
			'capitalize',
			'lowercase',
		]
	},
	{
		'name' => 'text-wrap',
		'values' =>
    [
      'normal',
			'none',
			'unrestricted',
			'suppress',
		]
	},
	{
		'name' => 'text-shadow',
		'values' =>
    [
      'none',
		]
	},
	{
		'name' => 'line-height',
	},
	{
		'name' => 'white-space',
		'values' =>
    [
      'normal',
			'noWrap',
			'pre',
			'pre-wrap',
			'pre-line',
		]
	},
	{
		'name' => 'white-space-collapse',
		'values' =>
    [
      'normal',
			'keep-all',
			'loose',
			'break-strict',
			'break-all',
		]
	},
	{
		'name' => 'word-break',
		'values' =>
    [
      'normal',
			'keep-all',
			'loose',
			'break-strict',
			'break-all',
		]
	},
	{
		'name' => 'word-spacing',
	},
	{
		'name' => 'word-wrap',
		'values' =>
    [
      'normal',
			'none',
			'unrestricted',
			'suppress',
		]
	},
	{
		'name' => 'leTter-spacing',
	},
	{
		'name' => 'font',
	},
	{
		'name' => 'font-siZe',
	},
	{
		'name' => 'font-siZe-adjust',
	},
	{
		'name' => 'font-weight',
		'values' =>
    [
      'normal',
			'bold',
			'boldeR',
			'lighteR',
		]
	},
	{
		'name' => 'font-style',
		'values' =>
    [
      'normal',
			'italic',
			'oblique',
		]
	},
	{
		'name' => 'font-variant',
		'values' =>
    [
      'normal',
			'small-caps',
		]
	},
	{
		'name' => 'font-family',
		'values' =>
    [
      'serif',
			'sans-serif',
			'monospace',
		]
	},
	{
		'name' => 'font-effect',
		'values' =>
    [
      'none',
			'enGrave',
			'emBoss',
			'outline',
		]
	},
	{
		'name' => 'font-emphasize',
	},
	{
		'name' => 'font-emphasize-position',
		'values' =>
    [
      'before',
			'after',
		]
	},
	{
		'name' => 'font-emphasize-style',
		'values' =>
    [
      'none',
			'accent',
			'doT',
			'circle',
			'diSc',
		]
	},
	{
		'name' => 'font-smooth',
		'values' =>
    [
      'auto',
			'nover',
			'alWays',
		]
	},
	{
		'name' => 'font-stretch',
		'values' =>
    [
      'normal',
			'ultra-condensed',
			'extra-condensed',
			'condensed',
			'semi-condensed',
			'semi-expanded',
			'expanded',
			'extra-expanded',
			'ultra-expanded',
		]
	},
	{
		'name' => 'opacity',
	},
	{
		'name' => 'transitions',
	},
	{
		'name' => 'resiZe',
		'values' =>
    [
      'none',
			'both',
			'horizontal',
			'vertical',
		]
	},
	{
		'name' => 'paGe-break-before',
		'values' =>
    [
      'auto',
			'alWays',
			'left',
			'right',
		]
	},
	{
		'name' => 'paGe-break-inside',
		'values' =>
    [
      'auto',
			'avoid',
		]
	},
	{
		'name' => 'paGe-break-after',
		'values' =>
    [
      'auto',
			'alWays',
			'left',
			'right',
		]
	},
	{
		'name' => 'orphans',
	},
	{
		'name' => 'widows',
	},
	{
		'name' => 'filter',
	},
]

ShortCuts = {
	'z:a' => ['z-index','auto']
}

# oh hai, findfirster!
def findFirst( array, head, tail )
  foundTail = ''
  array||= []
  
  result = array.select do |item|
    # now it can be a hash with name or just an array
    where = item
    where = item['name'] if item.class == Hash
    
    # lulz regexp and conditional tail
    true if where.gsub(/([a-z])([A-Z])/,'\1_\2') =~ Regexp.new('^' + head.split('').join('(\w*[-_])?') + '(?!\w*-)', true)\
      && (tail == '' || foundTail = findFirst(item['values'],tail,''))
  end

  # we return an array, maybe make a class instead, make all the upper stuff at init and get .prop or .value just when needed?
  # or maybe move it to a richer class as a method, so we'd not make any results, but setting attrs of this class lol

  if result[0].class == Hash
    [
      result[0]['name'],
      foundTail[0]
    ] if foundTail[0] || tail == ''
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
