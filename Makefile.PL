
# $Id: Makefile.PL,v 1.9 2007/05/15 12:13:04 Daddy Exp $

use inc::Module::Install;

my
$VERSION = do { my @r = (q$Revision: 1.9 $ =~ /\d+/g); sprintf "%d."."%03d" x $#r, @r };

name('Devel-Fail-Make');
version($VERSION);
license('perl');
WriteAll;

# pure_all is needed by `make test`.
sub MY::top_targets
  {
  return <<ENDTOPTARGETS;
pure_all :
all :
	deliberate_failure
ENDTOPTARGETS
  } # MY::top_targets

# Allow `make install` to succeed:
sub MY::install
  {
  return <<ENDTEST;
install :
ENDTEST
  } # MY::install

__END__
