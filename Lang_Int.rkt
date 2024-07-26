(define/public ((interp_exp env) e)
    (match e
        [(Int n) n]
        [(Prim ´read ´())
        (define r (read))
        (cond [(fixnum? r) r]
            [else (error ´ínterp_exp "read expected an Integer" r)])]
        [(Prim '- (list e)) (fx- 0 ((interp_exp env) e))]
        [(Prim '+ (list e1 e2)) 
            (fx+ ((interp_exp env) e1) ((interp_exp env) e2))]
        [(Prim '- (list e1 e2)) 
            (fx- ((interp_exp env) e1) ((interp_exp env) e2))]
    ))

(define/public (interp_program p)
    (match p
    [(Program '() e) ((interp_exp '()) e)])
)
