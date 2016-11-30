require 'socket'

REDIRECT_TO = "127.0.0.1"

# The executable name of your browser. The browser
# is auto killed after enabling hosts in order to
# clear your DNS cache.
BROWSER_BIN = "chromium"

BLOCK_LIST = [
  "www.reddit.com",
  "www.cnn.com",
  "www.johnstonefitness.com",
  "www.bbc.com",
  "www.imgur.com",
  "www.twitch.tv",
  "www.arenajunkies.com",
  "www.worldofwarcraft.com",
  "www.johnstonefitness.com",
  "redcache.slack.com",
  "www.slack.com",
  "www.facebook.com"
]

BASE_ENTRIES = 
"127.0.0.1	localhost
127.0.1.1	#{Socket.gethostname}	

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
"
