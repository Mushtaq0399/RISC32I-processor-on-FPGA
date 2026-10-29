# sum 1..10 -> x10 (a0). Our CPU will execute this by Day 15.
        li   x5, 0          # sum = 0
        li   x6, 1          # i   = 1
        li   x7, 11         # limit
loop:   bge  x6, x7, done   # if i >= 11, stop
        add  x5, x5, x6     # sum += i
        addi x6, x6, 1      # i++
        jal  x0, loop       # repeat
done:   add  x10, x5, x0    # result in a0 (should be 55)