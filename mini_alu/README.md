# Mini Alu

**Relazione di progetto**

Il progetto assegnato consiste nel progettare ed implementare una mini
alu, capace di fare addizioni e sottrazioni, tramite linguaggio VHDL.
Per la progettazione del sistema si è deciso di utilizzare un pattern
comportamentale, andando quindi a definire il comportamento del sistema
in base a determinate condizioni, oltretutto si è optato per l'utilizzo
del tipo *STD_LOGIC* e quindi *STD_LOGIC_VECTOR* per una maggiore
flessibilità e maggiori funzionalità.

Il primo passo della progettazione è stato definire la politica tramite
la quale la mini ALU potesse cambiare tra addizione e sottrazione. A
questo proposito si è deciso di mantenere un singolo adder, ma cambiare
il segno del secondo operando.

# Adder

## Implementazione

La componente di base del sistema è un carry look-ahead adder, che
genera quindi vari segnali generate e propagate a seconda del numero di
bit degli operandi. Riportiamo di seguito il codice dell'adder con caso
di default con 4 bit.

## Schematica

Il codice precedente con bit number 4, 8 e 16 ha generato in vivado le
schematiche riportate rispettivamente in *Figure 1*, *Figure 2*, *Figure
3*.

<figure>
<img src="https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/schematics/generic_4bit.png" style="width:100.0%" />
<img src="https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/schematics/generic_8bit.png" style="width:100.0%" />
<img src="https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/schematics/generic_16bit.png" style="width:100.0%" />
</figure>

# Mini ALU

## Implementazione

La mini ALU progettata presenta al suo interno un solo adder, preceduto
da un multiplexer, che in base al bit di controllo C decide se dare in
output B oppure il risultato di B invertito. Nell'adder poi, oltre ad A
ed al valore calcolato di B, verrà introdotto il valore di C stesso,
completando il complemento a 2 in caso di necessità, non apportando
cambiamenti altrimenti.

Possiamo trovare la schematica risultante nella seguene immagine:

![Circuito Logico del mini
ALU](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/schematics/generic_alu.png)

## TestBench

I test sono stati svolti in tutti i casi possibili, dando un tempo di 10
ns per ogni caso, con un tempo totale in nanosecondi:
$$2^{2n+1} \times 10$$

# Simulazione

Sono state effettuate simulazioni behavioural e post-implementation.
Vediamole, evidenziandone le differenze.

## 4 bit

Per prime analizziamo le simulazioni nel caso del circuito a 4 bit. Per
semplicita verranno riportate solo le immagini di alcuni momenti
salienti della simulazione

### Behavioural

![Cambio di Ic](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/behavioural/4bit/4bit_behav.png)

Possiamo notare come la simulazione in
*Figure [1](#4bit_behav){reference-type="ref" reference="4bit_behav"}*
restituisca i dati corretti senza nessun delay. Vediamo ora la stessa
situazione in un'implementazione reale.

### Post-implementation

![Fine output non definito](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/Post_Implementation/4bit/end_X.png)


Degna di nota la prima differenza mostrata in
*Figure [2](#4bit_pi_x){reference-type="ref" reference="4bit_pi_x"}*,
nonostante gli input vengano dati al tempo iniziale 0, sono necessari
3,738 ns affinche il circuito produca il primo risultato utile.

![Cambio di C](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/Post_Implementation/4bit/C_change.png)

Ancora, affinchè il risultato del cambio di valore di C possa essere
utilizzato sono necessari 3,948 ns, come si vede in
*Figure [3](#4bit_pi_c){reference-type="ref" reference="4bit_pi_c"}*

![Junction Temperature e Total Power](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/Post_Implementation/4bit/power.png)

Da *Figure [4](#4bit_power){reference-type="ref"
reference="4bit_power"}* notiamo che l'implementazione del circuito,
sebbene non presenti un clock, non produce problemi significativi dal
punto di vista della temperatura, grazie al basso numero di bit da
calcolare.

### LUT Tables

Dalla sintesi del circuito ci vengono restituite inoltre le LUT Tables
con i relativi valori di utilizzo. Il loro numero è riportato in
*Table [1](#lut_quantity_4bit){reference-type="ref"
reference="lut_quantity_4bit"}*, mentre in
*Figure [5](#lut_schematic_4bit){reference-type="ref"
reference="lut_schematic_4bit"}* troviamo la schematica del circuito
reale.

   Nome   Utilizzate   Tipo di utilizzo
  ------ ------------ ------------------
   IBUF       9               IO
   OBUF       5               IO
   LUT6       2              LUT
   LUT5       2              LUT
   LUT4       1              LUT
   LUT2       1              LUT


![Schematica circuito reale](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/LUT/4bit/LUT_schematic_4bit.png)

Riportiamo per completezza in
*Table [2](#lut_utilization_4bit){reference-type="ref"
reference="lut_utilization_4bit"}* anche l'utilizzazione delle LUT,
estremamente bassa a causa della semplicità del circuito

::: {#lut_utilization_4bit}
     Site Type     Used   Fixed   Prohibited   Available    Util%
  --------------- ------ ------- ------------ ----------- ---------
    Slice LUTs      5       0         0          53200     $<0.01$
   LUT as Logic     5       0         0          53200     $<0.01$
   LUT as Memory    0       0         0          17400     $0.00$

  : Numero LUT utilizzati nel circuito a 4 bit
:::

## 8 bit

Analizziamo ora le simulazioni ottenute nel caso di circuito a 8 bit.

### Behavioural

La *Figure [6](#8bit_behav){reference-type="ref"
reference="8bit_behav"}* illustra la simulazione behavioural, quindi
ideale.

![Simulazione 8
bit](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/behavioural/8bit/8bit_behav_sim.png){#8bit_behav
width="100%"}

### Post-implementation

Passando alla simulazione post-implementation, notiamo che il ritardo
inizia a diventare piuttosto importante. Dalla
*Figure [7](#8bit_pi_x){reference-type="ref" reference="8bit_pi_x"}*
vediamo infatti che per avere il primo valore utile saranno necessari
ben 7,5 ns sui 10 totali concessi.

![Primo valore
utile](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/Post_Implementation/8bit/end_x.png){#8bit_pi_x
width="100%"}

Negli istanti successivi il valore del ritardo tende ad assestarsi su
una media di circa 7 ns dalla ricezione degli input all'invio
dell'output corretto, come visibile dall'esempio generico della
*Figure [8](#random_val){reference-type="ref" reference="random_val"}*

![Dimostrazione ritardo di 6,98
ns](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/Post_Implementation/8bit/random_val.png){#random_val
width="100%"}

Dal punto di vista della temperatura il circuito ad 8 bit inizia a
risentire della mancanza di un clock. La
*Figure [9](#8bit_power){reference-type="ref" reference="8bit_power"}*
infatti mostra una temperatura massima raggiunta di oltre 100 gradi, che
rischia di compromettere la stabilità ed il funzionamento di un circuito
reale.

![Total On-Chip Power e Junction
Temperature](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/Post_Implementation/8bit/power.png){#8bit_power
width="100%"}

### LUT Tables

Le tables utilizzate nel circuito a 8 bit sono maggiori di quelle del
circuito a 4 bit, come vediamo dalle quantità mostrate in
*Table [3](#lut_quantity_8bit){reference-type="ref"
reference="lut_quantity_8bit"}* e dalla loro disposizione, evidenziata
in *Figure [10](#lut_schematic_8bit){reference-type="ref"
reference="lut_schematic_8bit"}*

::: {#lut_quantity_8bit}
   Nome   Utilizzate   Tipo di utilizzo
  ------ ------------ ------------------
   IBUF       17              IO
   OBUF       9               IO
   LUT6       6              LUT
   LUT5       3              LUT
   LUT4       2              LUT
   LUT2       1              LUT

  : Numero LUT utilizzati nel circuito a 8 bit
:::

![Schematica circuito
reale](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/LUT/8bit/LUT_schematic_8bit.png){#lut_schematic_8bit
width="100%"}

Nonostante questi incrementi, l'utilizzazione mostrata in figura
*Table [4](#lut_utilization_8bit){reference-type="ref"
reference="lut_utilization_8bit"}* rimane minima.

::: {#lut_utilization_8bit}
     Site Type     Used   Fixed   Prohibited   Available   Util%
  --------------- ------ ------- ------------ ----------- --------
    Slice LUTs      11      0         0          53200     $0.02$
   LUT as Logic     11      0         0          53200     $0.02$
   LUT as Memory    0       0         0          17400     $0.00$

  : Numero LUT utilizzati nel circuito a 4 bit
:::

## 16 Bit

Per la sezione finale andremo ad analizzare il comportamento della
nostra mini alu inl caso in cui abbia 16 bit.

### Behavioural

Riportiamo nella *Figure [11](#16bit_behav){reference-type="ref"
reference="16bit_behav"}* simulazione behavioural, per avere un modello
di riferimento.

![Simulazione ideale a 16
bit](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/behavioural/16bit/16bit_behav.png){#16bit_behav
width="100%"}

### Post-implementation

Analizziamo adesso la simulazione post-implementation, ponendo ancora
una volta la lente d'ingrandimento sui ritardi temporali rapportati alla
simulazione ideale. Dalla *Figure [12](#16bit_pi_x){reference-type="ref"
reference="16bit_pi_x"}* risulta evidente che questa implementazione
presenta dei problemi non indifferenti. A fronte dell'input iniziale dei
classici 10 ns, ne saranno necessari 11,817 per produrre il primo
risultato utile, portando ad uno sfasamento per cui il risultato di un
input verrà mostrato soltanto quando l'input successivo sarà già stato
ricevuto

![Primo valore
utile](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/Post_Implementation/16bit/end_x.png){#16bit_pi_x
width="100%"}

Prendendo un istante di tempo generico, nel nostro caso fissato a
11,911,821.768 ns, avremo come output -5757, risultato degli input
somministrati all'istante 11,911,810.000 ns,
*Figure [13](#random_val16){reference-type="ref"
reference="random_val16"}*. Da questo e da altri casi campionati
possiamo affermare che il ritardo medio che si verifica consiste proprio
nel valore iniziale osservato di 11,8 ns.

![Dimostrazione ritardo di 11,8
ns](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/Post_Implementation/16bit/random_val.png){#random_val16
width="100%"}

La temperatura del circuito raggiunge una quota insostenibile, a fronte
di una potenza di 14,276 w. La temperatura di giunzione mostrata in
*Figure [14](#16bit_power){reference-type="ref"
reference="16bit_power"}* non può considerarsi accurata in quanto Vivado
la possiede un limite massimo a 125 gradi Celsius, che verrebbero quindi
ampiamente superati.

![Total On-Chip Power e Junction
Temperature](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/simulations/Post_Implementation/16bit/power.png){#16bit_power
width="100%"}

### LUT Tables

Le tables utilizzate nel circuito continuano ad aumentare con
l'aumentare del numero di bit, come dimostra la
*Table [5](#lut_quantity_16bit){reference-type="ref"
reference="lut_quantity_16bit"}*. Riportiamo anche la schematica reale
in *Figure [15](#lut_schematic_16bit){reference-type="ref"
reference="lut_schematic_16bit"}*

::: {#lut_quantity_16bit}
   Nome   Utilizzate   Tipo di utilizzo
  ------ ------------ ------------------
   IBUF       33              IO
   LUT6       21             LUT
   OBUF       17              IO
   LUT5       9              LUT
   LUT4       4              LUT
   LUT2       2              LUT

  : Numero LUT utilizzati nel circuito a 16 bit
:::

![Schematica circuito
reale](https://github.com/Zi0LEO/elettronica_digitale/blob/main/mini_alu/report/assets/LUT/16bit/LUT_schematic_16bit.png){#lut_schematic_16bit
width="100%"}

L'utilizzazione è invece riportata in
*Table [6](#lut_utilization_16bit){reference-type="ref"
reference="lut_utilization_16bit"}*

::: {#lut_utilization_16bit}
     Site Type     Used   Fixed   Prohibited   Available   Util%
  --------------- ------ ------- ------------ ----------- --------
    Slice LUTs      32      0         0          53200     $0.06$
   LUT as Logic     32      0         0          53200     $0.06$
   LUT as Memory    0       0         0          17400     $0.00$

  : Numero LUT utilizzati nel circuito a 4 bit
:::
