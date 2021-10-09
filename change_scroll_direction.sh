#!/bin/zsh






change_scrolling_direction() {
 if (( $(is_natural_scrolling_active) == 1 )); then
  deactivate_natural_scrolling_direction
 else
  activate_natural_scrolling_direction
 fi
 
 
}


is_natural_scrolling_active() {
 echo $(defaults read -g com.apple.swipescrolldirection)
}

deactivate_natural_scrolling_direction() {
  defaults write -g com.apple.swipescrolldirection -bool FALSE
}

activate_natural_scrolling_direction() {
  defaults write -g com.apple.swipescrolldirection -bool TRUE
}


test_integration() {
 test_current_state_before=$(defaults read -g com.apple.swipescrolldirection)
 
 change_scrolling_direction
 
 test_current_state_after=$(defaults read -g com.apple.swipescrolldirection)
 
 if (( test_current_state_before == test_current_state_after )) then
  echo "Integration test failed"
 fi
}

# Used to call explicit methods from the terminal
# Functionality: Calls everything after the ./xxx.sh <here> call
"$@"
