package CPAN::Perl::Releases;

#ABSTRACT: Mapping Perl releases on CPAN to the location of the tarballs

use strict;
use warnings;
use vars qw[@ISA @EXPORT_OK];

use Exporter;

@ISA       = qw(Exporter);
@EXPORT_OK = qw(perl_tarballs perl_versions perl_pumpkins);

# Data gathered from using findlinks.pl script in this dists tools/
# directory, run over the src/5.0 of a local CPAN mirror.
our $cache = { };
our $data =
{
"5.004" => { id => 'CHIPS' },
"5.004_01" => { id => 'TIMB' },
"5.004_02" => { id => 'TIMB' },
"5.004_03" => { id => 'TIMB' },
"5.004_04" => { id => 'TIMB' },
"5.004_05" => { id => 'CHIPS' },
"5.005" => { id => 'GSAR' },
"5.005_01" => { id => 'GSAR' },
"5.005_02" => { id => 'GSAR' },
"5.005_03" => { id => 'GBARR' },
"5.005_04" => { id => 'LBROCARD' },
"5.6.0" => { id => 'GSAR' },
"5.6.1-TRIAL1" => { id => 'GSAR' },
"5.6.1-TRIAL2" => { id => 'GSAR' },
"5.6.1-TRIAL3" => { id => 'GSAR' },
"5.6.1" => { id => 'GSAR' },
"5.6.2" => { id => 'RGARCIA' },
"5.7.0" => { id => 'JHI' },
"5.7.2" => { id => 'JHI' },
"5.7.3" => { id => 'JHI' },
"5.8.0" => { id => 'JHI' },
"5.8.1" => { id => 'JHI' },
"5.8.2" => { id => 'NWCLARK' },
"5.8.3" => { id => 'NWCLARK' },
"5.8.4" => { id => 'NWCLARK' },
"5.8.5" => { id => 'NWCLARK' },
"5.8.6" => { id => 'NWCLARK' },
"5.8.7" => { id => 'NWCLARK' },
"5.8.8" => { id => 'NWCLARK' },
"5.8.9" => { id => 'NWCLARK' },
"5.9.0" => { id => 'HVDS' },
"5.9.1" => { id => 'RGARCIA' },
"5.9.2" => { id => 'RGARCIA' },
"5.9.3" => { id => 'RGARCIA' },
"5.9.4" => { id => 'RGARCIA' },
"5.9.5" => { id => 'RGARCIA' },
"5.10.0" => { id => 'RGARCIA' },
"5.10.1" => { id => 'DAPM' },
"5.11.0" => { id => 'JESSE' },
"5.11.1" => { id => 'JESSE' },
"5.11.2" => { id => 'LBROCARD' },
"5.11.3" => { id => 'JESSE' },
"5.11.5" => { id => 'SHAY' },
"5.12.0" => { id => 'JESSE' },
"5.12.1" => { id => 'JESSE' },
"5.12.2" => { id => 'JESSE' },
"5.12.3" => { id => 'RJBS' },
"5.12.4" => { id => 'LBROCARD' },
"5.12.5" => { id => 'DOM' },
"5.13.0" => { id => 'LBROCARD' },
"5.13.2" => { id => 'MSTROUT' },
"5.13.3" => { id => 'DAGOLDEN' },
"5.13.4" => { id => 'FLORA' },
"5.13.5" => { id => 'SHAY' },
"5.13.6" => { id => 'MIYAGAWA' },
"5.13.7" => { id => 'BINGOS' },
"5.13.8" => { id => 'ZEFRAM' },
"5.13.9" => { id => 'JESSE' },
"5.13.10" => { id => 'AVAR' },
"5.13.11" => { id => 'FLORA' },
"5.14.0" => { id => 'JESSE' },
"5.14.1" => { id => 'JESSE' },
"5.14.2-RC1" => { id => 'FLORA' },
"5.14.2" => { id => 'FLORA' },
"5.14.3" => { id => 'DOM' },
"5.14.4-RC1" => { id => 'DAPM' },
"5.14.4-RC2" => { id => 'DAPM' },
"5.14.4" => { id => 'DAPM' },
"5.15.0" => { id => 'DAGOLDEN' },
"5.15.1" => { id => 'ZEFRAM' },
"5.15.3" => { id => 'STEVAN' },
"5.15.4" => { id => 'FLORA' },
"5.15.5" => { id => 'SHAY' },
"5.15.6" => { id => 'DROLSKY' },
"5.15.7" => { id => 'BINGOS' },
"5.15.9" => { id => 'ABIGAIL' },
"5.16.0" => { id => 'RJBS' },
"5.16.1" => { id => 'RJBS' },
"5.16.2" => { id => 'RJBS' },
"5.16.3" => { id => 'RJBS' },
"5.17.0" => { id => 'ZEFRAM' },
"5.17.1" => { id => 'DOY' },
"5.17.2" => { id => 'TONYC' },
"5.17.3" => { id => 'SHAY' },
"5.17.4" => { id => 'FLORA' },
"5.17.5" => { id => 'FLORA' },
"5.17.7" => { id => 'DROLSKY' },
"5.17.8" => { id => 'ARC' },
"5.17.9" => { id => 'BINGOS' },
"5.18.0" => { id => 'RJBS' },
"5.18.1" => { id => 'RJBS' },
"5.19.1" => { id => 'DAGOLDEN' },
"5.19.3" => { id => 'SHAY' },
"5.19.4" => { id => 'SHAY' },
"5.19.5" => { id => 'SHAY' },
"5.19.6" => { id => 'BINGOS' },
"5.19.7" => { id => 'ABIGAIL' },
"5.18.2" => { id => 'RJBS' },
"5.19.9" => { id => 'TONYC' },
"5.19.10" => { id => 'ARC' },
"5.19.11" => { id => 'SHAY' },
"5.20.0" => { id => 'RJBS' },
"5.21.1" => { id => 'WOLFSAGE' },
"5.21.2" => { id => 'ABIGAIL' },
"5.21.3" => { id => 'PCM' },
"5.20.1-RC1" => { id => 'SHAY' },
"5.20.1-RC2" => { id => 'SHAY' },
"5.20.1" => { id => 'SHAY' },
"5.21.4" => { id => 'SHAY' },
"5.18.3" => { id => 'RJBS' },
"5.18.4" => { id => 'RJBS' },
"5.21.5" => { id => 'ABIGAIL' },
"5.21.6" => { id => 'BINGOS' },
"5.21.8" => { id => 'WOLFSAGE' },
"5.20.2-RC1" => { id => 'SHAY' },
"5.20.2" => { id => 'SHAY' },
"5.21.10" => { id => 'SHAY' },
"5.21.11" => { id => 'SHAY' },
"5.22.0" => { id => 'RJBS' },
"5.23.1" => { id => 'WOLFSAGE' },
"5.23.2" => { id => 'WOLFSAGE' },
"5.20.3-RC1" => { id => 'SHAY' },
"5.20.3-RC2" => { id => 'SHAY' },
"5.20.3" => { id => 'SHAY' },
"5.23.3" => { id => 'PCM' },
"5.23.4" => { id => 'SHAY' },
"5.22.1-RC1" => { id => 'SHAY' },
"5.22.1-RC2" => { id => 'SHAY' },
"5.23.5" => { id => 'ABIGAIL' },
"5.22.1-RC3" => { id => 'SHAY' },
"5.22.1-RC4" => { id => 'SHAY' },
"5.22.1" => { id => 'SHAY' },
"5.23.6" => { id => 'DAGOLDEN', noxz => 1 },
"5.23.7" => { id => 'STEVAN' },
"5.23.9" => { id => 'ABIGAIL' },
"5.22.2-RC1" => { id => 'SHAY' },
"5.22.2" => { id => 'SHAY' },
"5.24.0" => { id => 'RJBS' },
"5.25.2" => { id => 'WOLFSAGE' },
"5.22.3-RC1" => { id => 'SHAY' },
"5.24.1-RC1" => { id => 'SHAY' },
"5.25.3" => { id => 'SHAY' },
"5.22.3-RC2" => { id => 'SHAY' },
"5.24.1-RC2" => { id => 'SHAY' },
"5.22.3-RC3" => { id => 'SHAY' },
"5.24.1-RC3" => { id => 'SHAY' },
"5.25.4" => { id => 'BINGOS' },
"5.25.5" => { id => 'STEVAN' },
"5.22.3-RC4" => { id => 'SHAY' },
"5.24.1-RC4" => { id => 'SHAY' },
"5.25.6" => { id => 'ARC' },
"5.25.7" => { id => 'EXODIST' },
"5.22.3-RC5" => { id => 'SHAY' },
"5.24.1-RC5" => { id => 'SHAY', noxz => 1 },
"5.22.3" => { id => 'SHAY' },
"5.24.1" => { id => 'SHAY' },
"5.25.9" => { id => 'ABIGAIL' },
"5.25.10" => { id => 'RENEEB' },
"5.26.0" => { id => 'XSAWYERX' },
"5.27.1" => { id => 'EHERMAN' },
"5.22.4-RC1" => { id => 'SHAY' },
"5.24.2-RC1" => { id => 'SHAY' },
"5.22.4" => { id => 'SHAY' },
"5.24.2" => { id => 'SHAY' },
"5.27.2" => { id => 'ARC' },
"5.27.3" => { id => 'WOLFSAGE' },
"5.24.3-RC1" => { id => 'SHAY' },
"5.26.1-RC1" => { id => 'SHAY' },
"5.27.4" => { id => 'GENEHACK' },
"5.24.3" => { id => 'SHAY' },
"5.26.1" => { id => 'SHAY' },
"5.27.5" => { id => 'SHAY' },
"5.27.6" => { id => 'ETHER' },
"5.27.7" => { id => 'BINGOS' },
"5.27.8" => { id => 'ABIGAIL' },
"5.27.9" => { id => 'RENEEB' },
"5.27.10" => { id => 'TODDR' },
"5.24.4-RC1" => { id => 'SHAY' },
"5.26.2-RC1" => { id => 'SHAY' },
"5.24.4" => { id => 'SHAY' },
"5.26.2" => { id => 'SHAY' },
"5.27.11" => { id => 'XSAWYERX' },
"5.28.0-RC1" => { id => 'XSAWYERX' },
"5.28.0-RC2" => { id => 'XSAWYERX' },
"5.28.0-RC3" => { id => 'XSAWYERX' },
"5.28.0-RC4" => { id => 'XSAWYERX' },
"5.28.0" => { id => 'XSAWYERX' },
"5.29.0" => { id => 'XSAWYERX' },
"5.29.1" => { id => 'SHAY' },
"5.29.2" => { id => 'BINGOS' },
"5.29.3" => { id => 'GENEHACK' },
"5.29.4" => { id => 'ARC' },
"5.29.5" => { id => 'ETHER' },
"5.26.3" => { id => 'SHAY' },
"5.28.1" => { id => 'SHAY' },
"5.29.6" => { id => 'ABIGAIL' },
"5.29.7" => { id => 'ABIGAIL' },
"5.29.8" => { id => 'ATOOMIC' },
"5.29.9" => { id => 'ZAKAME' },
"5.28.2-RC1" => { id => 'SHAY' },
"5.28.2" => { id => 'SHAY' },
"5.29.10" => { id => 'XSAWYERX' },
"5.30.0-RC1" => { id => 'XSAWYERX' },
"5.30.0-RC2" => { id => 'XSAWYERX' },
"5.30.0" => { id => 'XSAWYERX' },
"5.31.0" => { id => 'XSAWYERX' },
"5.31.1" => { id => 'ETHER' },
"5.31.2" => { id => 'SHAY' },
"5.31.4" => { id => 'CORION' },
"5.31.5" => { id => 'SHAY' },
"5.30.1-RC1" => { id => 'SHAY' },
"5.30.1" => { id => 'SHAY' },
"5.31.6" => { id => 'BINGOS' },
"5.31.7" => { id => 'ATOOMIC' },
"5.31.8" => { id => 'WOLFSAGE' },
"5.31.9" => { id => 'RENEEB' },
"5.30.2-RC1" => { id => 'SHAY' },
"5.30.2" => { id => 'SHAY' },
"5.31.10" => { id => 'XSAWYERX' },
"5.31.11" => { id => 'XSAWYERX' },
"5.32.0-RC0" => { id => 'XSAWYERX' },
"5.28.3-RC1" => { id => 'XSAWYERX' },
"5.28.3" => { id => 'XSAWYERX' },
"5.30.3-RC1" => { id => 'XSAWYERX' },
"5.30.3" => { id => 'XSAWYERX' },
"5.32.0-RC1" => { id => 'XSAWYERX' },
"5.32.0" => { id => 'XSAWYERX' },
"5.33.0" => { id => 'XSAWYERX' },
"5.33.1" => { id => 'ETHER' },
"5.33.2" => { id => 'XSAWYERX' },
"5.33.3" => { id => 'SHAY' },
"5.33.5" => { id => 'CORION' },
"5.32.1-RC1" => { id => 'SHAY' },
"5.33.6" => { id => 'HYDAHY' },
"5.32.1" => { id => 'SHAY' },
"5.33.7" => { id => 'RENEEB' },
"5.33.8" => { id => 'ATOOMIC' },
"5.33.9" => { id => 'TODDR' },
"5.34.0-RC1" => { id => 'XSAWYERX' },
"5.34.0-RC2" => { id => 'XSAWYERX' },
"5.34.0" => { id => 'XSAWYERX' },
"5.35.0" => { id => 'RJBS' },
"5.35.1" => { id => 'CORION' },
"5.35.3" => { id => 'ETHER' },
"5.35.4" => { id => 'WOLFSAGE' },
"5.35.5" => { id => 'LEONT' },
"5.35.6" => { id => 'HYDAHY' },
"5.35.8" => { id => 'ATOOMIC' },
"5.35.9" => { id => 'RENEEB' },
"5.34.1-RC1" => { id => 'SHAY' },
"5.34.1-RC2" => { id => 'SHAY' },
"5.34.1" => { id => 'SHAY' },
"5.35.10" => { id => 'XSAWYERX' },
"5.35.11" => { id => 'SHAY' },
"5.36.0-RC2" => { id => 'RJBS' },
"5.36.0-RC3" => { id => 'RJBS' },
"5.36.0" => { id => 'RJBS' },
"5.37.0" => { id => 'RJBS' },
"5.37.1" => { id => 'WOLFSAGE' },
"5.37.2" => { id => 'ATOOMIC' },
"5.37.4" => { id => 'ETHER' },
"5.37.5" => { id => 'TODDR' },
"5.37.6" => { id => 'CORION' },
"5.37.7" => { id => 'HYDAHY' },
"5.37.8" => { id => 'RENEEB' },
"5.37.9" => { id => 'ETHER' },
"5.37.10" => { id => 'YVES' },
"5.36.1-RC1" => { id => 'SHAY' },
"5.36.1-RC2" => { id => 'SHAY' },
"5.36.1-RC3" => { id => 'SHAY' },
"5.37.11" => { id => 'SHAY' },
"5.36.1" => { id => 'SHAY' },
"5.38.0-RC1" => { id => 'RJBS' },
"5.38.0-RC2" => { id => 'RJBS' },
"5.38.0" => { id => 'RJBS' },
"5.39.1" => { id => 'SHAY' },
"5.39.2" => { id => 'PEVANS' },
"5.39.3" => { id => 'WOLFSAGE' },
"5.39.4" => { id => 'HAARG' },
"5.39.5" => { id => 'ETHER' },
"5.34.3" => { id => 'PEVANS' },
"5.36.3" => { id => 'PEVANS' },
"5.38.2" => { id => 'PEVANS' },
"5.39.6" => { id => 'BOOK' },
"5.39.7" => { id => 'CORION' },
"5.39.8" => { id => 'RENEEB' },
"5.39.9" => { id => 'PEVANS' },
"5.39.10" => { id => 'PEVANS' },
"5.40.0-RC1" => { id => 'HAARG' },
"5.40.0-RC2" => { id => 'HAARG' },
"5.40.0" => { id => 'HAARG' },
"5.41.1" => { id => 'BOOK' },
"5.41.2" => { id => 'ETHER' },
"5.41.3" => { id => 'BOOK' },
"5.41.4" => { id => 'CONTRA' },
"5.41.5" => { id => 'HYDAHY' },
"5.41.6" => { id => 'CONTRA' },
"5.41.7" => { id => 'CORION' },
"5.38.3-RC1" => { id => 'SHAY' },
"5.40.1-RC1" => { id => 'SHAY' },
"5.38.3" => { id => 'SHAY' },
"5.40.1" => { id => 'SHAY' },
"5.41.8" => { id => 'SHAY' },
"5.41.9" => { id => 'HYDAHY' },
"5.41.10" => { id => 'MAUKE' },
"5.38.4-RC1" => { id => 'SHAY' },
"5.40.2-RC1" => { id => 'SHAY' },
"5.38.4" => { id => 'SHAY' },
"5.40.2" => { id => 'SHAY' },
"5.41.11" => { id => 'ETHER' },
"5.41.12" => { id => 'ETHER' },
"5.41.13" => { id => 'BOOK' },
"5.42.0-RC1" => { id => 'CONTRA' },
"5.42.0-RC2" => { id => 'CONTRA' },
"5.42.0-RC3" => { id => 'CONTRA' },
"5.42.0" => { id => 'BOOK' },
};

sub perl_tarballs {
  my $vers = shift;
  return unless defined $vers;
  $vers = shift if eval { $vers->isa(__PACKAGE__) };
  return unless exists $data->{ $vers };
  if ( exists $cache->{ $vers } ) {
    return { %{ $cache->{ $vers } } };
  }
  my $pumpkin = $data->{ $vers }->{id};
  my $path = join '/', substr( $pumpkin, 0, 1 ), substr( $pumpkin, 0, 2 ), $pumpkin;
  my $sep = ( $vers =~ m!^5\.0! ? '' : '-' );
  my $perl = join $sep, 'perl', $vers;
  my $onlygz = 1 if $vers =~ m!(?-xism:5.(?:00(?:4(?:_0[12345])?|5(?:_0[1234])?|3_07)|1(?:0.0(?:-RC[12])?|6.0-RC0)|6.(?:[02]|1(?:-TRIAL[123])?)|9.[12345]|7.[0123]|8.[01]))! || $data->{ $vers }->{onlygz};
  my $onlybz2 = 1 if $data->{ $vers }->{onlybz2};
  my $noxz = 1 if $data->{ $vers }->{noxz};
  my $lvers;
  {
    my $tvers = $vers;
    $tvers =~ s!\-?(TRIAL|RC)\d*!!g;
    $tvers =~ s!_!.!g;
    my @parts = split m!\.!, $tvers;
    push @parts, 0 if scalar @parts < 3;
    $lvers = sprintf("%d.%03d%03d",@parts);
  }
  my $foo = { };
  $foo->{'tar.gz'} = "$path/$perl.tar.gz" unless $onlybz2;
  $foo->{'tar.bz2'} = "$path/$perl.tar.bz2" unless $onlygz || $lvers > 5.027005;
  $foo->{'tar.xz'} = "$path/$perl.tar.xz" if $lvers > 5.021005 && !$noxz;
  delete $foo->{'tar.bz2'} if $pumpkin eq 'SHAY' && $lvers < 5.028000;
  $cache->{ $vers } = $foo;
  return { %$foo };
}

sub perl_versions {
    return sort _by_version keys %$data;
}


sub _by_version {
  my %v = map {
    my @v = split(qr/[-._]0*/, $_);
    $v[2] ||= 0;
    $v[3] ||= 'Z';
    ($_ => sprintf '%d.%03d%03d-%s', @v)
  } $a, $b;
  $v{$a} cmp $v{$b};
}

sub perl_pumpkins {
    my %pumps = map { ( $data->{$_}->{id} => 1 ) } keys %$data;
    return sort keys %pumps;
}

q|Acme::Why::Did::I::Not::Read::The::Fecking::Memo|;

=pod

=head1 SYNOPSIS

  use CPAN::Perl::Releases qw[perl_tarballs];

  my $perl = '5.14.0';

  my $hashref = perl_tarballs( $perl );

  print "Location: ", $_, "\n" for values %{ $hashref };

=head1 DESCRIPTION

CPAN::Perl::Releases is a module that contains the mappings of all C<perl> releases that have been uploaded to CPAN to the
C<authors/id/> path that the tarballs reside in.

This is static data, but newer versions of this module will be made available as new releases of C<perl> are uploaded to CPAN.

=head1 FUNCTIONS

=over

=item C<perl_tarballs>

Takes one parameter, a C<perl> version to search for. Returns an hashref on success or C<undef> otherwise.

The returned hashref will have a key/value for each type of tarball. A key of C<tar.gz> indicates the location
of a gzipped tar file and C<tar.bz2> of a bzip2'd tar file. The values will be the relative path under C<authors/id/>
on CPAN where the indicated tarball will be located.

  perl_tarballs( '5.14.0' );

  Returns a hashref like:

  {
    "tar.bz2" => "J/JE/JESSE/perl-5.14.0.tar.bz2",
    "tar.gz" => "J/JE/JESSE/perl-5.14.0.tar.gz"
  }

Not all C<perl> releases had C<tar.bz2>, but only a C<tar.gz>.

Perl tarballs may also be compressed using C<xz> and therefore have a C<tar.xz> entry.

=item C<perl_versions>

Returns the list of all the perl versions supported by the module in ascending order. C<TRIAL> and C<RC> will be lower
than an actual release.

=item C<perl_pumpkins>

Returns a sorted list of all PAUSE IDs of Perl pumpkins.

=back

=head1 SEE ALSO

L<http://www.cpan.org/src/5.0/>

=cut
