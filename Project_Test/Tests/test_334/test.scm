   
         (if (or #t "dalse")
          (begin 'display 'x 'x)
          (begin 'display 'y 'y))
        (if (and #f "false")
          (begin 'display "x" 'x)
          (begin 'display "y" 'y))
        (if (or (and 3 4 5) 1 2)
          (and 3 4)
          (or 567 5))
      
    