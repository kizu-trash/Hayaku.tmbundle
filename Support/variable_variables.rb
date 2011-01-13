#*_*#

$syntax_space = ENV['TM_CSS_SPACE'] || ''
$syntax_tab = ''
if ENV['TM_SOFT_TABS'] == 'YES'
  ENV['TM_TAB_SIZE'].to_i.times { $syntax_tab<<' ' }
else
  $syntax_tab = "\t"
end
$extra_indent = (ENV['TM_CURRENT_LINE'].match(/^\s+/) || [''])[0].sub($syntax_tab,'')

$indent = $extra_indent + $syntax_tab
$before_closing = $extra_indent + (ENV['TM_CSS_BEFORE_CLOSING'] || '');
