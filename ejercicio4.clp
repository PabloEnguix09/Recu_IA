(deffacts ejercicio(brazo pila1 C B A pila2 E D mesa C E)
)

(defrule meta
?f1 <- (brazo pila1 A E B D pila2 C mesa A C)
=>
(halt)
)

(defrule coger-bloque-pila1
?f1 <- (brazo pila1 ?x pila2 $?ini2 mesa $iniM)
=>
(assert (brazo ?x pila1 pila2 $?ini2 mesa $iniM))
)

(defrule coger-bloque-pila2
?f1 <- (brazo pila1 $?ini1 pila2 ?x mesa $iniM)
=>
(assert (brazo ?x pila1 $?ini1 pila2 mesa $iniM))
)

(defrule dejar-bloque-pila1
?f1 <- (brazo ?x pila1 pila2 $?ini2 mesa $iniM)
=>
(assert (brazo pila1 ?x pila2 $?ini2 mesa $iniM))
)

(defrule dejar-bloque-pila2
?f1 <- (brazo ?x pila1 $?ini1 pila2)
=>
(assert (brazo pila1 $?ini1 pila2 ?x))
)

(defrule apilar-bloque-pila1
?f1 <- (brazo ?x pila1 $?ini1 pila2 $?ini2)
=>
(assert (brazo pila1 $?ini1 ?x pila2 $?ini2))
)

(defrule desapilar-bloque-pila1
?f1 <- (brazo pila1 $?ini1 ?x pila2 $?ini2)
=>
(assert (brazo ?x pila1 $?ini1 pila2 $?ini2))
)

(defrule apilar-bloque-pila2
?f1 <- (brazo ?x pila1 $?ini1 pila2 $?ini2)
=>
(assert (brazo pila1 $?ini1 pila2 $?ini2 ?x))
)

(defrule desapilar-bloque-pila2
?f1 <- (brazo pila1 $?ini1 pila2 $?ini2 ?x)
=>
(assert (brazo ?x pila1 $?ini1 pila2 $?ini2))
)