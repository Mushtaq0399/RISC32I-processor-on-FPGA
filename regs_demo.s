# Show how registers are used. Result ends up in a0.
        li   t0, 7          # t0 (x5)  = 7        ("load immediate")
        li   t1, 5          # t1 (x6)  = 5
        add  t2, t0, t1     # t2 (x7)  = 7 + 5 = 12
        add  a0, t2, zero   # a0 (x10) = t2 + x0  -> copy result into a0 (=12)
        # x0/zero tricks:
        add  t3, zero, zero # t3 = 0 + 0 = 0      (clear a register)
        # 'li' and 'mv' are pseudo-instructions the assembler turns into
        # real RV32I ops (e.g. addi t0, x0, 7).