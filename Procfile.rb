ENV['RTFM_REPOS'] ||= "#{Dir.pwd}:/"
ENV['RTFMd_WIKI'] ||= Dir.pwd
ENV['RTFMd_BASE_PATH'] ||= "/"
rtfm = %x(bundle show RTFMd).strip
private_event = %x(bundle show private_event).strip
<<HERE
rtfm: thin start -R #{rtfm}/config/rtfmd.ru
hostess: thin start -R #{private_event}/config/hostess.ru
git: git daemon --reuseaddr --verbose  --base-path=. --export-all ./.git
HERE
