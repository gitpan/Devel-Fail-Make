
use ExtUtils::MakeMaker;

my
$VERSION = do { my @r = (q$Revision: 1.6 $ =~ /\d+/g); sprintf "%d."."%03d" x $#r, @r };

WriteMakefile(
              NAME => 'Devel::Fail::Make',
              VERSION => $VERSION,
             );

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

