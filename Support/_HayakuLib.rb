#*_*#
require ENV['TM_SUPPORT_PATH'] + '/lib/exit_codes.rb'

# Partially inspired by Duane Johnson's Multiple Arbitrary Simultaneous Carets http://inquirylabs.com/blog2009/my-textmate-bundle/
# But with a lot of improvements, ideas, quirks and things. And made from scratch, yeah.

def SetCaret()
  if ENV['TM_SELECTED_TEXT']
    # need to toggle current caret and replace it with initial tabstop (or it can't be so? Or do not enter replace mode after toggling?)
    if ENV['TM_COLUMNS'].to_i < 78
      # Column mode (multiple caret pairs) (need to place only one "current" pair, all other must be "old" )
      print ENV['TM_SELECTED_TEXT'].gsub(/^(.*)$/,'⦉\1⦊')
    else
      # Normal mode (one pair of carets)
      print "⦉" + ENV['TM_SELECTED_TEXT'] + "⦊"
    end
  else
    print "⦉⦊"
  end
end

def ReplaceCarets()
  result = STDIN.read
  if result.index(/⦉[^⦊]*⦊/)
    result.gsub!(/⟨([^⦊]*)⟩/,'${1/^(⟨)?.+$/(?1:⟨\1⟩:$0)/g}') if result.index(/⟨[^⦊]*⟩/)
    result.gsub!(/⦉([^⦊]*)⦊/,'${1:⟨\1⟩}$0${1/^.+$//g}')
  else
    # There need to be a single-quote check
  end
  print result
end
