use strict;
use warnings;
use Module::Build;

my $buiild = Module::Build->new(
    dist_author => 'takuji@senchan.jp <takuji@senchan.jp>',
    dist_abstract => 'Try-Simple',
    license     => 'perl',
    module_name => 'Try::Simple',
    configure_requires => {'Module::Build' => '0.38'},
    requires => {
        'Class::Accessor::Lite' => '0.05',
    },
    build_requires => {
        'Test::LoadAllModules'       => '0.021',
        'Test::More'                 => '0.98',
    },
    test_files => (-d '.git/' || $ENV{RELEASE_TESTING}) ? 't/ xt/' : 't/',
    recursive_test_files => 1,

    create_readme => 1,
    create_license => 1,
    create_makefile_pl => 'small',
);
$buiild->create_build_script();
