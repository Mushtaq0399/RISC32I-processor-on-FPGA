# Sum 1..10 into a0, then load/store a value. Shows 5 instruction families.
        addi t0, x0, 0      # t0 = 0          (arithmetic-immediate)
        addi t1, x0, 1      # t1 = 1  (i)
        addi t2, x0, 11     # t2 = 11 (limit)
loop:   bge  t1, t2, done   # if i >= 11, exit (branch)
        add  t0, t0, t1     # sum += i        (arithmetic R-type)
        addi t1, t1, 1      # i++             (immediate)
        jal  x0, loop       # repeat          (jump)
done:   mv   a0, t0         # a0 = sum (=55)  (pseudo -> addi a0,t0,0)

        # memory demo:
        sw   a0, 0(sp)      # store sum to memory at sp  (store)
        lw   a1, 0(sp)      # load it back into a1       (load)