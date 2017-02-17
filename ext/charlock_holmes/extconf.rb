require 'mkmf'

dir_config 'icu'

rubyopt = ENV.delete("RUBYOPT")

have_library 'z' or abort 'libz missing'
have_library 'icuuc' or abort 'libicuuc missing'
have_library 'icudt' or abort 'libicudt missing'
have_library 'icuin' or abort 'libicuin missing'


$CFLAGS << ' -Wall -funroll-loops'
$CFLAGS << ' -Wextra -O0 -ggdb3' if ENV['DEBUG']

ENV['RUBYOPT'] = rubyopt
create_makefile 'charlock_holmes/charlock_holmes'
