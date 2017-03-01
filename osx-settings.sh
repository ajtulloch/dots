set -ex
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false
defaults write com.apple.iTunes show-store-arrow-links -bool FALSE
defaults write com.apple.dashboard mcx-disabled -boolean true
# defaults write ~/.MacOSX/environment PATH "`echo $PATH`"
defaults write com.apple.mail PollTime 240
defaults write -g ApplePressAndHoldEnabled -bool false
