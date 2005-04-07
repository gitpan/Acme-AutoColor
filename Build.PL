use Module::Build;

my $build = Module::Build->new
    (
     module_name => 'Acme::AutoColor',
     license => 'perl',
     requires => {
       'perl'                       => '5.6.0',
       'Graphics::ColorNames'       => 0.32,
     },
     recommends => {
#        'Test::Pod::Coverage'        => 0,
#        'Test::Pod'                  => 1.00,
#        'Test::Portability::Files'   => 0,
#        'Test::Prereq'               => 0,
     },
     build_requires => {
       'Test::More'                 => 0,
     },
     create_readme      => 1,
     create_makefile_pl => 'traditional',
     dist_author        => 'Robert Rothenberg <rrwo at cpan.org>',
     sign               => 1,
);

$build->create_build_script;
