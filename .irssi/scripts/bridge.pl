use strict;
use Digest::MD5 qw(md5_hex);

my ($password) = "";

sub notice {
  my ($server, $msg, $nick, $address, $target) = @_;

  my ($challenge) = $msg =~ m{^\S+\s+:!ZNCAO\s+CHALLENGE\s+(.*)$};
  my ($response) = md5_hex($password . "::" . $challenge);

  Irssi::active_win->print("znc auto-op challenge: $msg, $nick, $address");
  $server->command("NOTICE $nick !ZNCAO RESPONSE $response");
}

Irssi::signal_add("event notice", "notice");
