#import "@preview/ilm:1.4.1": *

#set text(lang: "en")

#show: ilm.with(
  title: "APPS zkouška simplified",
  author: "Adamekka",
  abstract: "Academic weapon for academic comeback",
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)

= Architektura počítačů

Základní koncept definoval blud *John von Neumann* v roce 1945 pro počítač EDVAC.

Položili základ konceptu počítače řízeného obsahem paměti. Dnešní počítače vychází z tohoto konceptu.

== von Neumannova architektura

1. Struktura počítače je nezávislá na úloze.
2. Instrukce aji data jsou v jedné paměti.
3. Paměť je rozdělena do buněk stejné velikosti, jejich pořadí se využívá jako adresy.
4. Sekvenční vykonávání instrukcí.
5. Větvení programu se provede pomocí skoku (podmíněný a nepodmíněný).
6. Používá binární soustavu.
7. Skládá se z CPU (ALU + řadič), paměti a vstupně-výstupní jednotky.

#figure(image("imgs/1-arch/von-neumann.png"), caption: "von Neumannova architektura")

=== Výhody

1. 1 Sběrnice je cheap.
2. Rozdělení paměti pro data a kód určuje programátor.
2. Stejný způsob přístupu ke kódu programu aji k datům.

=== Nevýhody

1. Data můžou přepsat kód.
2. 1 Sběrnice je úzké místo.

== Harvardská architektura

Několik let po von Neumann, bludi z Harvardu udělali vlastní koncept počítače.

TLDR: Rozdělili paměť na paměť programu a paměť dat.

=== Výhody

1. CPU může zároveň číst z paměti a programu a paměti dat, protože obojí je přes jinou sběrnici.
2. Data nemůžou přepsat kód.

=== Nevýhody

1. Každá paměť může mít jinačí adresovací velikost.
2. 2 Sběrnice jsou expensive.

== Kapacita paměti

Paměť se skládá z buněk stejné velikosti. Nejrozšířenější buňky maji 1 byte (8 bits).

#figure(image("imgs/1-arch/harvard.png"), caption: "Harvardská architektura")

#pagebreak()

== Kontrolní otázky

=== Jaké jsou základní principy fungování počítače?

Struktura počítače není závislá na úloze. Paměť je rozdělena do buněk, jejich pořadová čísla jsou využita jako adresy. Program se vykonává sekvenčně. Počítač používá binární soustavu. Skládá se z CPU, paměti a vstupně-výstupní jednotky.

=== Jaké má výhody a nevýhody architektura počítače dle von Neumanna?

1 Sběrnice je cheap. Protože paměť programu a dat jsou uloženy na jednom místě, tak k nim přistupujeme stejně a mají stejnou adresovací velikost.

1 Sběrnice je úzké místo, data můžou přepsat kód.

=== Přinesla harvardská architektura nějaká vylepšení proti von Neumannově?

Rozdělení paměti na paměť dat a paměť kódu. Data nemůžou přepsat kód.

2 Sběrnice, které umožňují paralelní access k datům a kódu.

=== Jaká je podpora paralelismu u obou architektur počítačů?

Není, jejich princip je sekvenční vykonávání instrukcí. Paralelismus se musí simulovat na OS úrovni.

=== Je lepší mít oddělené paměti pro data i program? Proč ano a proč ně?

Data pak nepřepíšou kód a CPU může zároveň číst z obou.

Expensive, adresy nemají stejnou velikost, nemůžeme využít nevyužitou paměť pro to druhé.

=== Může fungovat počítač bez paměti či bez periférií?

Ne, CPU potřebuje od někud číst program, číst a zapisovat někam data a musí mít I/O, jinak s ním nemůžeme komunikovat.

=== K čemu se v počítači využívá dvojková soustava?

K reprezentaci dat, kódu a adres v počítači.

=== Zvyšují sběrnice výkon počítače?

Mohou, pokud způsobem zpomalení je přístup do paměti.

=== Je možné, aby procesor prováděl instrukce jinak, než sekvenčně?

U těchto architektur to není možné, tyhle architektury nemůžou provádět instrukce paralelně, jde ale udělat na úrovni OS.

=== Jak je v počítači organizovaná paměť?

Paměť v počítači je organizovaná do buněk o stejné velikosti, většinou 1 byte, procesor má IP reg, který ukazuje na instrukci která se má vykonat. Paměť může být rozdělena na část pro kód a data, např: Harvardská.

= Jazyk symbolických instrukcí, strojové instrukce, Assembler

== Registry

Registry jsou paměťové jednotky v procesoru, které uchovávají dočasné data a instrukce během operací.

Procesor je používá pro rychlou manipulaci s daty a instrukcemi.

RIP - instruction pointer.

FLAGS - state register (ZF, CF, OF, SF).

== Adresování

Adresování se dělí na přímé a nepřímé. Přímé používá pevnou adresu. Nepřímé používá adresu v registru.

V 64bit se adresuje pomocí:

[ Bázový + Indexový \* Měřítko + konstanta]
