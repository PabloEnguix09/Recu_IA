(deffacts ejercicio(brazo pila1 C B A pila2 E D mesa C E)
)

(defrule meta
(or (brazo pila1 A E B D pila2 C mesa A C) (brazo pila1 C pila2 A E B D mesa C A))
=>
(halt)
)

(defrule coger-bloque-pila1
?f1 <- (brazo pila1 ?x pila2 $?ini2 mesa $?iniM ?x1 $?finM)
(test (eq ?x ?x1))
=>
(assert (brazo ?x pila1 pila2 $?ini2 mesa $?iniM $?finM))
)

(defrule coger-bloque-pila2
?f1 <- (brazo pila1 $?ini1 pila2 ?x mesa $?iniM ?x2 $?finM)
(test (eq ?x ?x2))
=>
(assert (brazo ?x pila1 $?ini1 pila2 mesa $?iniM $?finM))
)

(defrule desapilar-bloque-pila1
?f1 <- (brazo pila1 $?ini1 ?x pila2 $?ini2 mesa $?iniM)
(test (> (length$ $?ini1) 0))
=>
(assert (brazo ?x pila1 $?ini1 pila2 $?ini2 mesa $?iniM))
)

(defrule desapilar-bloque-pila2
?f1 <- (brazo pila1 $?ini1 pila2 $?ini2 ?x mesa $?iniM)
(test (> (length$ $?ini2) 0))
=>
(assert (brazo ?x pila1 $?ini1 pila2 $?ini2 mesa $?iniM))
)

(defrule dejar-bloque-pila
?f1 <- (brazo ?x pila1 pila2 $?ini2 mesa $?iniM)
=>
(assert (brazo pila1 pila2 $?ini2 mesa ?x $?iniM))
)

(defrule apilar-bloque-pila1
?f1 <- (brazo ?x pila1 $?ini1 pila2 $?ini2 mesa $?iniM)
=>
(assert (brazo pila1 $?ini1 ?x pila2 $?ini2 mesa $?iniM))
)

(defrule apilar-bloque-pila2
?f1 <- (brazo ?x pila1 $?ini1 pila2 $?ini2 mesa $?iniM)
=>
(assert (brazo pila1 $?ini1 pila2 $?ini2 ?x mesa $?iniM))
)