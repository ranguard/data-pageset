use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'		=> 'Data::Pageset',
    'VERSION_FROM'	=> 'lib/Data/Pageset.pm',
    'PREREQ_PM'		=> {
		'Data::Page'	=> 2.00,
		'Test::More' 	=> 0.1,
    },
    META_MERGE          => {
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url => 'https://github.com/ranguard/data-pageset.git',
				web => 'https://github.com/ranguard/data-pageset',
			},
		},
    },
);
