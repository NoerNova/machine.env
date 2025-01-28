### aliases zone ###
####################

alias cls="clear"
alias py="python3"
alias iosemulator="open -a Simulator"
# alias ll="colorls -l --sd --time-style='+%d-%m-%y'"
alias nvt="nvim +NvimTreeToggle"
alias vnt="nvim"
alias yt-dl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' $argv"
alias pjm="bat ~/.projectman"
alias androidemu="emulator -avd Pixel4 -netspeed full -netdelay none &"
alias android="/Users/noernova/Library/Android/sdk/tools/bin/avdmanager"
alias copypath="pwd | tr -d '\n' | pbcopy"
alias python="python3"
alias trans="~/.config/trans"
alias opengit="open https://github.com/noernova"

alias yt-dl2="python3 -m youtube_dl -f mp4 --verbose -x --user-agent 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.6533.103 Mobile Safari/537.36' $argv"

alias openshannews="open https://shannews.org && 
                    open https://burmese.shannews.org &&
                    open https://english.shannews.org &&
                    open https://radio.shannews.org &&
                    open https://building.shannews.org"

alias loginshannews="open https://shannews.org/login-with-shansecurity2024 &&
                    open https://burmese.shannews.org/login-with-shansecurity2024 &&
                    open https://english.shannews.org/login-with-shansecurity2024 &&
                    open https://radio.shannews.org/login-with-shansecurity2024 &&
                    open https://building.shannews.org/login-with-shansecurity2024"

alias shantraffic="open 'https://shannews.org/wp-admin/admin.php?page=WordfenceTools&subpage=livetraffic' &&
                  open 'https://burmese.shannews.org/wp-admin/admin.php?page=WordfenceTools&subpage=livetraffic' &&
                  open 'https://english.shannews.org/wp-admin/admin.php?page=WordfenceTools&subpage=livetraffic' &&
                  open 'https://radio.shannews.org/wp-admin/admin.php?page=WordfenceTools&subpage=livetraffic' &&
                  open 'https://building.shannews.org/wp-admin/admin.php?page=WordfenceTools&subpage=livetraffic'"

alias sshshannews="ssh -i /Users/noernova/Desktop/SHAN/Security/SecurityKey/2021/shannews-ssh-key shannews@128.199.168.231"

### function zone ###
#####################

alias search="search_google"

function search_google
  open "https://www.google.com/search?q=$argv"
end


# open google translate
alias e2t="translate_en2th"

function translate_en2th
  open "https://translate.google.com/?sl=en&tl=th&text=$argv&op=translate"
end

alias t2e="translate_th2en"

function translate_th2en
  open "https://translate.google.com/?sl=th&tl=en&text=$argv&op=translate"
end

# curl "https://www.googleapis.com/language/translate/v2?key=&source=en&target=de&q=Hello%20World"
