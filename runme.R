source('funcs/a.R')
source('funcs/b.R')
source('funcs/c.R') # defines c_func to not overwrite base::c
source('funcs/d.R')

result <- d(c_func(b(a()))) # should be 1
result == sqrt(2*2)/2  # should be true

# library(magrittr)
# a %>% b %>% c_func %>% d

# or as a unit testing
library(testthat)
test_that("bugs are fixed",{
 chain_result <- d(c_func(b(a())))
 expected_result <- 1
 expect_equal(chain_result, expected_result)})