function maxTriSum ([int[]]$numbers)
{  
    ($numbers | select -Unique | Sort-Object -Descending)[0..2] | ForEach{$sum += $_}
    return $sum
}

<#
function maxTriSum ([int[]]$numbers)
{
    $numbers = $numbers | select -Unique
    $numbers = $numbers | sort -Descending
    $numbers[0..2] | ForEach{$sum += $_}  
    return $sum
}
#>

Describe "maxTriSum" {
  It "should return 17 when input is @(3,2,6,8,2,3)" {
    [int]$expected = 17;
    [int]$actual = maxTriSum (@(3,2,6,8,2,3));

    $actual | Should Be $expected;
  }

  It "should return 32 when input is @(2,9,13,10,5,2,9,5)" {
    [int]$expected = 32;
    [int]$actual = maxTriSum (@(2,9,13,10,5,2,9,5));

    $actual | Should Be $expected;
  }

  It "should return 18 when input is @(2,1,8,0,6,4,8,6,2,4)" {
    [int]$expected = 18;
    [int]$actual = maxTriSum (@(2,1,8,0,6,4,8,6,2,4));

    $actual | Should Be $expected;
  }

  It "should return -9 when input is @(-3,-27,-4,-2,-27,-2)" {
    [int]$expected = -9;
    [string]$actual = maxTriSum (@(-3,-27,-4,-2,-27,-2));

    $actual | Should Be $expected;
  }

  It "should return -33 when input is @(-14,-12,-7,-42,-809,-14,-12)" {
    [int]$expected = -33;
    [int]$actual = maxTriSum (@(-14,-12,-7,-42,-809,-14,-12));

    $actual | Should Be $expected;
  }

  It "should return 232 when input is @(-13,-50,57,13,67,-13,57,108,67)" {
    [int]$expected = 232;
    [int]$actual = maxTriSum (@(-13,-50,57,13,67,-13,57,108,67));

    $actual | Should Be $expected;
  }

  It "should return 41 when input is @(-7,12,-7,29,-5,0,-7,0,0,29)" {
    [int]$expected = 41;
    [int]$actual = maxTriSum (@(-7,12,-7,29,-5,0,-7,0,0,29));

    $actual | Should Be $expected;
  }
}