sub server_incoming {
  my ($server, $data) = @_;
  print "server_incoming: $data"
}

Irssi::signal_add("server incoming", "server_incoming")
