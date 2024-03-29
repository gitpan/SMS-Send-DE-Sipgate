
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'SMS::Send driver to send via sipgate.de',
  'AUTHOR' => 'Dominik Schulz <dominik.schulz@gauner.org>',
  'BUILD_REQUIRES' => {
    'English' => '0',
    'File::Spec' => '0',
    'Test::Kwalitee' => '0',
    'Test::More' => '0',
    'Test::Perl::Critic' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'SMS-Send-DE-Sipgate',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'SMS::Send::DE::Sipgate',
  'PREREQ_PM' => {
    'HTTP::Cookies' => '0',
    'SMS::Send::Driver' => '0',
    'XMLRPC::Lite' => '0',
    'parent' => '0'
  },
  'VERSION' => '0.03',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



