use strict;
use Test::LoadAllModules;
use Test::More;

BEGIN {
    all_uses_ok(
        search_path => "Try::Simple",
        except => [],
    );
}


diag "Testing Try::Simple/$Try::Simple::VERSION";
