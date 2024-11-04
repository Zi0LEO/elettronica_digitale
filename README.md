# Carry Select Adder a 16 bit

**Relazione di progetto**

Il progetto assegnato consiste nel progettare ed implementare un carry
select adder a 16 bit tramite linguaggio VHDL. Per la progettazione del
sistema si è deciso di utilizzare un pattern comportamentale, andando
quindi a definire il comportamento del sistema in base a determinate
condizioni, oltretutto si è optato per l'utilizzo del tipo *STD_LOGIC* e
quindi *STD_LOGIC_VECTOR* per una maggiore flessibilità e maggiori
funzionalità.

Il primo passo della progettazione è stato definire la modularizzazione
dell'adder tramite adder più semplici a minori bit. A questo riguardo si
è optato per utilizzare 4 ripplecarry adder a 4 bit, ognuno formato da 4
full-adder.

## Full-Adder

### Implementazione

Come componente di base del sistema si è optato per un semplice
full-adder. A causa della decisione di approcciare il problema in
maniera comportamentale piuttosto che strutturale già nel caso base
possiamo vedere l'utilizzo di un assegnamento della variabile
*carry_out* tramite condizioni.

### Schematica

Il codice precedente ha generato in Vivado la schematica riportata in
*Figure 1*. Da notare la creazione di RTL_MUX causata dal blocco
condizionale *when else*;

![Circuito Logico del Full Adder](https://github.com/Zi0LEO/elettronica_digitale/blob/main/images/fulladder.png)

### Testbench

Essendo presenti 3 entrate e quindi sole $2^3=8$ possibli combinazioni,
si è deciso di testare ogni caso possibile. Sono stati implementati
anche gli statement *assert* per verificare la correttezza degli output
e quindi eseguire dei test.

### Simulazione

Il risultato della testbench sopra indicata è illustrato nella seguente
simulazione:

![Simulazione fulladder](https://github.com/Zi0LEO/elettronica_digitale/blob/main/images/fulladder_sim.png)

## Ripple-Carry Adder a 4 bit

### Implementazione

L'addizionatore a propagazione del riporto conta al suo interno 4 full
adder a 1 bit che lavorano insieme, il *carry_out* finale viene salvato.

### Schematica

![Circuito Logico del Ripple Carry Adder](https://github.com/Zi0LEO/elettronica_digitale/blob/main/images/ripplecarry.png)

### TestBench

Nella fase di testing essendo impossibile testare ogni caso sono stati
implementati i test soltanto di alcune situazioi notevoli.


### Simulazione

Il risultato della testbench sopra indicata è illustrato nella seguente
simulazione:

![Simulazione ripple carry](https://github.com/Zi0LEO/elettronica_digitale/blob/main/images/ripple_carry_sim.png)

## Carry-Select Adder

### Implementazione

Nella fase iniziale vengono istanziati i vari addizionatori Ripple Carry
con le loro varianti con *carry_in* '0' e '1', con il costrutto *when
else* viene selezionato quale risultato delle somme è quello da
utilizzare, la variabile che ha il ruolo di selezionatore è
*carry_selector* che è assegnata al valore del riporto
dell'addizionatore precedente, è una variabile shared perché deve essere
acceduta in più di un processo. Si è optato per una assegnazione di tipo
dichiarativa piuttosto che posizionale, producendo un codice più lungo
ma anche più robusto. Per il risultato si è deciso di utilizzare un
vettore di *STD_LOGIC* a 17 bit piuttosto che a 16 allo scopo di
prevenire l'overflow.

### Schematica

La schematica del carry select adder comprende 7 ripplecarry adder a 4
bit e 6 multiplexer. Degno di nota è che nel codice non è presente alcun
multiplexer, questi vengono infatti generati automaticamente a partire
dalle istruzioni condizionali.

![Circuito logico del Carry select adder](https://github.com/Zi0LEO/elettronica_digitale/blob/main/images/carry_select_schematics.png)

### Testbench

Discorso analogo a quello del Ripple Carry Adder.

### Simulazione

Il risultato della testbench sopra indicata è illustrato nella seguente
simulazione:

![Simulazione Carry select adder](https://github.com/Zi0LEO/elettronica_digitale/blob/main/images/carry_select_sim.png)
