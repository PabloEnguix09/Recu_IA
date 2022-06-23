(deffacts ejercicio(brazo pila1 C B A pila2 E D mesa C E)
(pila C B A)
(pila E D)
(mesa C E)
)

(defrule meta
?f1 <- (brazo pila1 A E B D pila2 C mesa A C)
=>
(halt)
)

(defrule coger-bloque-pila1
?f1 <- (brazo pila1 ?x $?fin pila2 $?ini2 mesa $?iniM ?x $?finM)
=>
(assert (brazo ?x pila1 $?fin pila2 $?ini2 mesa $?iniM $?finM))
)

(defrule coger-bloque-pila2
?f1 <- (brazo pila1 $?ini1 pila2 $?ini2 ?x $?fin2 mesa $?iniM ?x $?finM)
=>
(assert (brazo ?x pila1 $?ini1 pila2 $?ini2 $?fin2 mesa $?iniM $?finM))
)

(defrule dejar-bloque-pila1
?f1 <- (brazo ?x pila1 $ini1 pila2 $?ini2 mesa $?iniM)
=>
(assert (brazo pila1 $?ini1 ?x pila2 $?ini2 mesa $?ini ?x))
)

(defrule apilar-bloque
?f1 <- (brazo ?x)
?f2 <- (pila $?ini )
=>
(assert (brazo ))
(assert (pila $?ini ?x))
)

(defrule desapilar-bloque
?f1 <- (brazo )
?f2 <- (pila $?ini ?x)
=>
(assert (brazo ?x))
(assert (pila $?ini))
)