
use ExtUtils::MakeMaker;

my
$VERSION = do { my @r = (q$Revision: 1.5 $ =~ /\d+/g); sprintf "%d."."%03d" x $#r, @r };

WriteMakefile(
              NAME => 'Devel::Fail::Make',
              VERSION => $VERSION,
             );

sub MY::top_targets
  {
  return <<ENDTOPTARGETS;
all :
	deliberate_failure
ENDTOPTARGETS
  } # MY::top_targets

# Allow `make test` to succeed:
sub MY::test
  {
  return <<ENDTEST;
pure_all :
test :
ENDTEST
  } # MY::test

# Allow `make install` to succeed:
sub MY::install
  {
  return <<ENDTEST;
install :
ENDTEST
  } # MY::install

__END__

