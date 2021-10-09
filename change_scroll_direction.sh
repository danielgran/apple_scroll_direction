#!/bin/zsh






change_scrolling_direction() {
 toggle_scroll_direction_applescript_strategy
}

is_natural_scrolling_active() {
 echo $(defaults read -g com.apple.swipescrolldirection)
}

 toggle_scroll_direction_applescript_strategy() {
  osascript change_strategy.scpt what1 ever2
}


## Integration Test

test_integration() {
 test_current_state_before=$(defaults read -g com.apple.swipescrolldirection)
 change_scrolling_direction
 test_current_state_after=$(defaults read -g com.apple.swipescrolldirection)
 
 if (( test_current_state_before == test_current_state_after )) then
   echo " ❌ Test failed."
   return 0
 fi
  
  change_scrolling_direction
  test_current_state_after=$(defaults read -g com.apple.swipescrolldirection)
  
  if (( test_current_state_before != test_current_state_after )) then
    echo " ❌ Test failed."
    return 0
  fi
  
  echo " ✅ Test passed."
}

# Used to call explicit methods from the terminal
# Functionality: Calls everything after the ./xxx.sh <here> call
"$@"
