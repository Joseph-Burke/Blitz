require 'open3'
require 'byebug'

# Transcribes German text into IPA
# Open3 runs a command in the shell.

# Obviously, it's necessary to have the espeak tool
# available in the shell. It can be found on Homebrew.

ipa = stdout.strip

def german_to_ipa german_text
  stdout, status = Open3.capture2(
    'espeak -v de+f3 -s 50 --ipa -q',
    stdin_data: german_text
  )

  stdout.strip
end
