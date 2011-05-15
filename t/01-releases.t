use strict;
use warnings;
use Test::More qw[no_plan];
use CPAN::Perl::Releases qw[perl_tarballs];

my $perl = '5.14.0';

my $expected = {
 "tar.bz2" => "J/JE/JESSE/perl-5.14.0.tar.bz2",
 "tar.gz" => "J/JE/JESSE/perl-5.14.0.tar.gz"
};

{
  my $got = perl_tarballs( $perl );
  is_deeply( $got, $expected, 'Imported function' );
}

{
  my $got = CPAN::Perl::Releases::perl_tarballs( $perl );
  is_deeply( $got, $expected, 'Package Function' );
}

{
  my $got = CPAN::Perl::Releases->perl_tarballs( $perl );
  is_deeply( $got, $expected, 'Class method' );
}

{
  my $got = perl_tarballs( '6.0.0' );
  ok( !$got, 'Should not have this release' );
}
