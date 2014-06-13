#!/usr/bin/env perl -p

# Turn LaTeX stuff into xml

# $1*10^{-2}$]
s%
  \$
  (1\*)?
  10
  \^
  \{?([^\}\$]*)\}?
  \$
 %<inlinemath>${1}10<superscript>${2}</superscript></inlinemath>%gx;

# $x_{1}$
s%
  \$
  ([a-z][a-z]*)
  _
  \{?(.)\}?
  \$
 %<inlinemath>${1}<subscript>${2}</subscript></inlinemath>%gx;

# $x_2=b_1$
s%
  \$
  ([a-z][a-z]*)
  _
  \{?(.)\}?
  =([a-z][a-z]*)
  _
  \{?(.)\}?
  \$
 %<inlinemath>${1}<subscript>${2}</subscript>=${3}<subscript>${4}</subscript></inlinemath>%gx;

# $x_2=b_1=t_2$
s%
  \$
  ([a-z][a-z]*)
  _
  \{?(.)\}?
  =
  ([a-z][a-z]*)
  _
  \{?(.)\}?
  =
  ([a-z][a-z]*)
  _
  \{?(.)\}?
  \$
 %<inlinemath>${1}<subscript>${2}</subscript>=${3}<subscript>${4}</subscript></inlinemath>%gx;

