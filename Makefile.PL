
# $Id: Makefile.PL,v 1.13 2008/03/07 00:18:31 Daddy Exp $

use inc::Module::Install;

my
$VERSION = do { my @r = (q$Revision: 1.13 $ =~ /\d+/g); sprintf "%d."."%03d" x $#r, @r };

name('Devel-Fail-Make');
version($VERSION);
abstract('This distro causes an error during the `make` phase.');
author('Martin Thurn <mthurn@cpan.org>');
license('perl');
build_recommends('Test::Pod');
build_recommends('Test::Pod::Coverage');
build_requires  ('Test::Simple');
WriteAll;

# pure_all is needed by `make test`.
sub MY::top_targets
  {
  return <<ENDTOPTARGETS;
pure_all : pm_to_blib
all : pm_to_blib
	deliberate_failure
ENDTOPTARGETS
  } # MY::top_targets

# Allow `make install` to succeed (even though it does nothing):
sub MY::install
  {
  return <<ENDTEST;
install : 
ENDTEST
  } # MY::install

__END__
