# Simple Warehouse

```
ruby runner.rb  
Type `help` for instructions on usage
> init 10 10
> store 6 7 3 3 P
> store 1 1 3 5 P
> store 9 2 2 2 Q
> view
  ______________________________
10|__|__|__|__|__|__|__|__|__|__|
09|__|__|__|__|__|PP|PP|PP|__|__|
08|__|__|__|__|__|PP|PP|PP|__|__|
07|__|__|__|__|__|PP|PP|PP|__|__|
06|__|__|__|__|__|__|__|__|__|__|
05|PP|PP|PP|__|__|__|__|__|__|__|
04|PP|PP|PP|__|__|__|__|__|__|__|
03|PP|PP|PP|__|__|__|__|__|QQ|QQ|
02|PP|PP|PP|__|__|__|__|__|QQ|QQ|
01|PP|PP|PP|__|__|__|__|__|__|__|
   1  2  3  4  5  6  7  8  9  10
> store 5 5 2 2 C
> view
  ______________________________
10|__|__|__|__|__|__|__|__|__|__|
09|__|__|__|__|__|PP|PP|PP|__|__|
08|__|__|__|__|__|PP|PP|PP|__|__|
07|__|__|__|__|__|PP|PP|PP|__|__|
06|__|__|__|__|CC|CC|__|__|__|__|
05|PP|PP|PP|__|CC|CC|__|__|__|__|
04|PP|PP|PP|__|__|__|__|__|__|__|
03|PP|PP|PP|__|__|__|__|__|QQ|QQ|
02|PP|PP|PP|__|__|__|__|__|QQ|QQ|
01|PP|PP|PP|__|__|__|__|__|__|__|
   1  2  3  4  5  6  7  8  9  10
> locate C
  ______________________________
10|__|__|__|__|__|__|__|__|__|__|
09|__|__|__|__|__|__|__|__|__|__|
08|____|__|__|__|__|__|__|__|__|
07|__|__|__|__|__|__|__|__|__|__|
06|__|__|__|__|CC|CC|__|__|__|__|
05|__|__|__|__|CC|CC|__|__|__|__|
04|__|__|__|__|__|__|__|__|__|__|
03|__|__|__|__|__|__|__|__|__|__|
02|__|__|__|__|__|__|__|__|__|__|
01|__|__|__|__|__|__|__|__|__|__|
   1  2  3  4  5  6  7  8  9  10
> locate Q
  ______________________________
10|__|__|__|__|__|__|__|__|__|__|
09|__|__|__|__|__|__|__|__|__|__|
08|__|__|__|__|__|__|__|__|__|__|
07|__|__|__|__|__|__|__|__|__|__|
06|__|__|__|__|__|__|__|__|__|__|
05|__|__|__|__|__|__|__|__|__|__|
04|__|__|__|__|__|__|__|__|__|__|
03|__|__|__|__|__|__|__|__|QQ|QQ|
02|__|__|__|__|__|__|__|__|QQ|QQ|
01|__|__|__|__|__|__|__|__|__|__|
   1  2  3  4  5  6  7  8  9  10
> view
  ______________________________
10|__|__|__|__|__|__|__|__|__|__|
09|__|__|__|__|__|PP|PP|PP|__|__|
08|__|__|__|__|__|PP|PP|PP|__|__|
07|__|__|__|__|__|PP|PP|PP|__|__|
06|__|__|__|__|CC|CC|__|__|__|__|
05|PP|PP|PP|__|CC|CC|__|__|__|__|
04|PP|PP|PP|__|__|__|__|__|__|__|
03|PP|PP|PP|__|__|__|__|__|QQ|QQ|
02|PP|PP|PP|__|__|__|__|__|QQ|QQ|
01|PP|PP|PP|__|__|__|__|__|__|__|
   1  2  3  4  5  6  7  8  9  10
> remove 8 9
> view
  ______________________________
10|__|__|__|__|__|__|__|__|__|__|
09|__|__|__|__|__|__|__|__|__|__|
08|__|__|__|__|__|__|__|__|__|__|
07|__|__|__|__|__|__|__|__|__|__|
06|__|__|__|__|CC|CC|__|__|__|__|
05|PP|PP|PP|__|CC|CC|__|__|__|__|
04|PP|PP|PP|__|__|__|__|__|__|__|
03|PP|PP|PP|__|__|__|__|__|QQ|QQ|
02|PP|PP|PP|__|__|__|__|__|QQ|QQ|
01|PP|PP|PP|__|__|__|__|__|__|__|
   1  2  3  4  5  6  7  8  9  10|

> store 6 6 2 2 C
crate does not fit
> store 10 8 2 2 C
crate does not fit

```
