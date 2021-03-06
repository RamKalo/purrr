% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list-modify.R
\name{list_modify}
\alias{list_modify}
\alias{list_merge}
\alias{update_list}
\title{Modify a list}
\usage{
list_modify(.x, ...)

list_merge(.x, ...)
}
\arguments{
\item{.x}{List to modify.}

\item{...}{New values of a list. Use \code{zap()} to remove values.

These values should be either all named or all unnamed. When
inputs are all named, they are matched to \code{.x} by name. When they
are all unnamed, they are matched positionally.

\link[rlang:dyn-dots]{Dynamic dots} are supported. In particular, if
your functions are stored in a list, you can splice that in with
\verb{!!!}.}
}
\description{
\code{list_modify()} and \code{list_merge()} recursively combine two lists, matching
elements either by name or position. If a sub-element is present in
both lists, \code{list_modify()} takes the value from \code{y}, and \code{list_merge()}
concatenates the values together.

\code{update_list()} handles formulas and quosures that can refer to
values existing within the input list. Note that this function
might be deprecated in the future in favour of a \code{dplyr::mutate()}
method for lists.
}
\examples{
x <- list(x = 1:10, y = 4, z = list(a = 1, b = 2))
str(x)

# Update values
str(list_modify(x, a = 1))
# Replace values
str(list_modify(x, z = 5))
str(list_modify(x, z = list(a = 1:5)))

# Remove values
str(list_modify(x, z = zap()))

# Combine values
str(list_merge(x, x = 11, z = list(a = 2:5, c = 3)))


# All these functions support dynamic dots features. Use !!! to splice
# a list of arguments:
l <- list(new = 1, y = zap(), z = 5)
str(list_modify(x, !!!l))
}
