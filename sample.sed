#!/bin/sed
1,3{
    s/aaa/eee/g
    y/abc/xyz/
    p
    w output.txt
}
