ENV['RTFM_REPOS'] ||= "#{Dir.pwd}:/"
ENV['RTFMd_WIKI'] ||= Dir.pwd
ENV['RTFMd_BASE_PATH'] ||= "/"
rtfm_ru = %x(bundle show RTFMd).strip
<<HERE
rtfm: thin start -R #{rtfm_ru}/config/rtfmd.ru
git: git daemon --reuseaddr --verbose  --base-path=. --export-all ./.git
HERE
