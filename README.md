# NAME

Data::Pageset - Page numbering and page sets

# SYNOPSIS

```perl
use Data::Pageset;
my $page_info = Data::Pageset->new({
    'total_entries'       => $total_entries,
    'entries_per_page'    => $entries_per_page,
    # Optional, will use defaults otherwise.
    'current_page'        => $current_page,
    'pages_per_set'       => $pages_per_set,
    'mode'                => 'fixed', # default, or 'slide'
});

# General page information
print "         First page: ", $page_info->first_page, "\n";
print "          Last page: ", $page_info->last_page, "\n";
print "          Next page: ", $page_info->next_page, "\n";
print "      Previous page: ", $page_info->previous_page, "\n";

# Results on current page
print "First entry on page: ", $page_info->first, "\n";
print " Last entry on page: ", $page_info->last, "\n";

# Can add in the pages per set after the object is created
$page_info->pages_per_set($pages_per_set);

# Page set information
print "First page of previous page set: ",  $page_info->previous_set, "\n";
print "    First page of next page set: ",  $page_info->next_set, "\n";

# Print the page numbers of the current set
foreach my $page (@{$page_info->pages_in_set()}) {
    if($page == $page_info->current_page()) {
        print "<b>$page</b> ";
    } else {
        print "$page ";
    }
}
```

# DESCRIPTION

The object produced by Data::Pageset can be used to create page
navigation. It inherits from Data::Page and has access to all
methods from this object.

In addition, it also provides methods for dealing with set of pages,
so that if there are too many pages you can easily break them
into chunks for the user to browse through.

You can even choose to view page numbers in your set in a "sliding"
fashion.

The object can easily be passed to a templating system
such as Template Toolkit or be used within a script.

# METHODS

## new()

```perl
use Data::Pageset;
my $page_info = Data::Pageset->new({
    'total_entries'       => $total_entries,
    'entries_per_page'    => $entries_per_page,
    # Optional, will use defaults otherwise.
    'current_page'        => $current_page,
    'pages_per_set'       => $pages_per_set,
    'mode'                => 'slide', # default fixed
});
```

This is the constructor of the object, it requires an anonymous
hash containing the 'total\_entries', how many data units you have
and the number of 'entries\_per\_page' to display. Optionally
the 'current\_page' (defaults to page 1) and pages\_per\_set (how
many pages to display, defaults to 10) can be added.

The mode (which defaults to 'fixed') determines how the paging
will work. For example, with 10 pages\_per\_set and the current\_page
set to 18 you will get the following results:

### Fixed:

- Pages in set:

    11,12,13,14,15,16,17,18,19,20

- Previous page set:

    1

- Next page set:

    21

### Slide:

- Pages in set:

    14,15,16,17,18,19,20,21,22,23

- Previous page set:

    9

- Next page set:

    24

You can not change modes once the object is created.

## current\_page()

```
$page_info->current_page($page_num);
```

This method sets the current\_page to the argument supplied. It can also be
set in the constructor, but you may want to reuse the object if printing out
multiple pages. It will then return the page number once set.

If this method is called without any arguments it returns the current page number.

## pages\_per\_set()

```
$page_info->pages_per_set($number_of_pages_per_set);
```

Calling this method initialises the calculations required to use
the paging methods below. The value can also be passed into
the constructor method new().

If called without any arguments it will return the current
number of pages per set.

## previous\_set()

```
print "Back to previous set which starts at ", $page_info->previous_set(), "\n";
```

This method returns the page number at the start of the previous page set.
undef is return if pages\_per\_set has not been set.

## next\_set()

```
print "Next set starts at ", $page_info->next_set(), "\n";
```

This method returns the page number at the start of the next page set.
undef is returned if pages\_per\_set has not been set.

## pages\_in\_set()

```perl
foreach my $page_num (@{$page_info->pages_in_set()}) {
    print "Page: $page_num \n";
}
```

This method returns an array ref of the page numbers within
the current set. undef is returned if pages\_per\_set has not been set.

# EXPORT

None by default.

# AUTHOR

Leo Lapworth `<LLAP@cuckoo.org>`

# REPOSITORY

https://github.com/ranguard/data-pageset

# CONTRIBUTORS

Ryan D Johnson `<ryan@innerfence.com>`
PLOBBES

# SEE ALSO

[Data::Page](https://metacpan.org/pod/Data%3A%3APage).

# COPYRIGHT

Copyright (C) 2007, Leo Lapworth

This module is free software; you can redistribute it or modify it
under the same terms as Perl itself.

# BUGS

Please report any bugs or feature requests on the bugtracker website
[https://rt.cpan.org/Public/Dist/Display.html?Name=Data-Pageset](https://rt.cpan.org/Public/Dist/Display.html?Name=Data-Pageset) or by
email to
[bug-Data-Pageset@rt.cpan.org](mailto:bug-Data-Pageset@rt.cpan.org).

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

# AUTHOR

Leo Lapworth <leo@cuckoo.org>

# CONTRIBUTORS

- David Steinbrunner <dsteinbrunner@pobox.com>
- Edward Betts <edward@4angle.com>
- Graham Knop <haarg@haarg.org>
- Olaf Alders <olaf@wundersolutions.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2007 by Leo Lapworth.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
