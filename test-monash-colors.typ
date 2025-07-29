#import "cover.typ": cover
#import "heading.typ": apply as apply-heading
#import "page.typ": apply as apply-page, apply-header-footer

#set text(lang: "en")

#show: apply-page
#show: apply-heading

// Test the Monash color scheme
= Monash Color Scheme Test

This document demonstrates the Monash University color scheme applied to the template.

== Primary Colors

=== Monash Blue
This heading uses Monash Blue - the primary brand color.

=== Bright Blue
This heading uses Bright Blue - the secondary color.

=== Monash Navy
This heading uses Monash Navy - medium contrast.

== Cover Page Test

#cover(
  [Monash University Report Template],
  "Test Author",
  datetime(year: 2024, month: 7, day: 30),
  datetime(year: 2024, month: 7, day: 30),
  subtitle: "Demonstrating the Monash color scheme",
  logo-horizontal: true,
)

#pagebreak()

#show: apply-header-footer.with(short-title: "Monash Colors")

= Additional Testing

This page demonstrates the header with Monash Blue text color.

== Sample Content

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

=== Subsection Example
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

==== Detail Section
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
