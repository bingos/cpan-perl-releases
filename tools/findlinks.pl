use strict;
use warnings;
use File::Spec;
use autodie;
use CPAN::DistnameInfo;

my $dir = shift or die;
die unless -d $dir;

my %data;

opendir my $DIR, $dir;

while( my $file = readdir $DIR ) {
  next if $file =~ /^\./ or $file !~ /^perl.+(bz2|gz)$/;
  my $abs = File::Spec->catfile( $dir, $file );
  next unless -l $abs;
  my $link = readlink $abs;
  $link =~ s#^.*/authors/id/##;
  my $d = CPAN::DistnameInfo->new( $link );
  $data{ $d->version }->{ $d->extension} = $link;
}

{
  use Data::Dumper;
  local $Data::Dumper::Indent=1;
  print Dumper( \%data );
}
