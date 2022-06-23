(deffacts (brazo )
(pila C B A)
(pila E D)
(mesa C E)
)

(defrule meta
?f1 <= (brazo )
?f2 <= (pila A E B D )
?f3 <= (pila C )
=>
(halt)
)

(defrule coger-bloque
?f1 <= (brazo )
?f2 <= (pila ?x $?fin)
?f3 <= (mesa $?ini ?x $?fin)
(test (> (length $?fin) 0))
=>
(assert (brazo ?x))
(assert (pila $?fin))
(assert (mesa $?ini $?fin))
)

(defrule dejar-bloque
?f1 <= (brazo ?x)
?f2 <= (mesa $?ini)
=>

)

(defrule apilar-bloque
?f1 <= (brazo ?x)
?f2 <= (pila $?pila )
=>
(assert (brazo ))
(assert (pila $?ini ?x))
)

(defrule desapilar-bloque
?f1 <= (brazo )
?f2 <= (pila $?ini ?x)
=>
(assert (brazo ?x))
(assert (pila $?ini))
)