#*_*#
require ENV['TM_SUPPORT_PATH'] + '/lib/exit_codes.rb'
require ENV['TM_SUPPORT_PATH'] + '/lib/escape.rb'

# Partially inspired by Duane Johnson's Multiple Arbitrary Simultaneous Carets http://inquirylabs.com/blog2009/my-textmate-bundle/
# But with a lot of improvements, ideas, quirks and things. And made from scratch, yeah.

def FindSimilliar()
  result = e_sn(STDIN.read)
  
  @original = result.match(/⦉([^⦊]*)⦊/)[0].gsub(/[⦉⦊]/,'')
  
  result.gsub!(/(#{Regexp.escape(@original)})(?!⦊)/,'⟨\1⟩')
  
  ReplaceCarets(result)
end

def SetCaret()
  if ENV['TM_SELECTED_TEXT']
    # need to toggle current caret and replace it with initial tabstop (or it can't be so? Or do not enter replace mode after toggling?)
    if ENV['TM_COLUMNS'].to_i < 78
      # Column mode (multiple caret pairs) (need to place only one "current" pair, all other must be "old" )
      needActual = true
      print ENV['TM_SELECTED_TEXT'].gsub(/^(.*)$/){
        if needActual
          needActual = false
          '⦉' + $1 + '⦊'
        else
          '⟨' + $1 + '⟩'
        end
      }
    else
      # Normal mode (one pair of carets)
      print "⦉" + ENV['TM_SELECTED_TEXT'] + "⦊"
    end
  else
    print "⦉⦊"
  end
end

def ReplaceCarets(someInput)
  result = someInput || e_sn(STDIN.read)
  result.sub!(/⟨([^⟩]*)⟩/m,'⦉\1⦊') if !result.index(/⦉[^⦊]*⦊/)
  
  if someInput
    result.gsub!(/⟨([^⟩]*)⟩/m,'${1}') if result.index(/⟨[^⟩]*⟩/)
    result.gsub!(/⦉([^⦊]*)⦊/m,'${1:\1}$0${1/^.+$//gm}') if result.index(/⦉[^⦊]*⦊/)
  else
    result.gsub!(/⟨([^⟩]*)⟩/m,'${1/^(⟨)?.+$/(?1:⟨\1⟩:$0)/gm}') if result.index(/⟨[^⟩]*⟩/)
    result.gsub!(/⦉([^⦊]*)⦊/m,'${1:⟨\1⟩}$0${1/^.+$//gm}') if result.index(/⦉[^⦊]*⦊/)
  end

  print result
end
