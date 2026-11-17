# =============================================================================
# PMM — Selbststudium 2026-11-17: Mittelwertsvergleich (z-Test / t-Test)
# Lektion: unterricht/KM7-01-mittelwertsvergleich-t-test
# Daten:   assets/betriebsdaten.csv (120 Messungen, Soll 10,00 mm, Toleranz +-0,15 mm)
# Autor:   Suad Bajraktarovic
# =============================================================================

library(tidyverse)

# Arbeitsverzeichnis = Projektordner (ISO-8601: 2026-11-17_selbststudium_t_test)
daten <- read_csv("data/betriebsdaten.csv", show_col_types = FALSE)


# =============================================================================
# 1. VORHERSAGEN (ohne R) — und Kontrolle
# =============================================================================

# a) Gueltige Messungen je Maschine
# Vorhersage: M1 = 37, M2 = 39, M3 = 40 (vier Messungen fehlen: 3 bei M1, 1 bei M2)
kennzahlen <- daten |>
  group_by(maschine) |>
  summarise(
    n        = sum(!is.na(masse_mm)),
    mittel   = mean(masse_mm, na.rm = TRUE),
    streuung = sd(masse_mm, na.rm = TRUE),
    .groups  = "drop"
  )
kennzahlen
#> M1 37  10.00054  0.03150
#> M2 39   9.97692  0.04000
#> M3 40  10.06275  0.06960   -> Vorhersage stimmt.

# b) Groesster Abstand zum Sollmass 10,00 mm
# Vorhersage: M3, rund 0,06 mm (6 Hundertstel) ueber dem Soll.
mutate(kennzahlen, abstand = mittel - 10)
#> M1 +0,00054 mm | M2 -0,02308 mm | M3 +0,06275 mm
#> -> M3 weicht am staerksten ab: ca. 0,06 mm (6 Hundertstel).

# c) Welcher Vergleich faellt statistisch leichter durch?
# Vorhersage: M1 gegen M3. Zwar ist die Streuung groesser (0,070 vs. 0,040 mm),
# aber der Effekt (0,062 mm) waechst staerker als das Rauschen:
#   M1/M2: t ~ 0,024 / 0,0083 ~ 2,9
#   M1/M3: t ~ 0,062 / 0,0122 ~ 5,1
# -> M1/M3 ist klarer nachweisbar (siehe Aufgabe 2: p = 4,1e-06 vs. 0,0055).


# =============================================================================
# 2. DER UNPAAARTE VERGLEICH: M1 gegen M3 (Welch-t-Test)
# =============================================================================

# H0: mu(M1) = mu(M3)   -- die Maschinen haben denselben Mittelwert (Differenz = 0)
# H1: mu(M1) != mu(M3)  -- die Mittelwerte sind unterschiedlich (zweiseitig)

vergleich <- daten |> filter(maschine %in% c("M1", "M3"))
t13 <- t.test(masse_mm ~ maschine, data = vergleich)
t13
#> t = -5,1132 | df = 55,272 | p = 4,092e-06
#> 95%-KI (M1 - M3): [-0,08659 ; -0,03783]
#> Mittelwerte: M1 = 10,00054 mm | M3 = 10,06275 mm

# Lesart des Konfidenzintervalls in ganzen Saetzen:
# M3 liegt mindestens um 0,0378 mm und hoechstens um 0,0866 mm ueber M1.
# Die Toleranz betraegt +/- 0,15 mm. Das gesamte Intervall (0,0378 bis 0,0866 mm)
# liegt innerhalb der Toleranz -- es ragt nicht hinaus.


# =============================================================================
# 3. DER GEPAAARTE VERGLEICH (ueber Chargenmittel, 10 Paare)
# =============================================================================

chargen <- daten |>
  group_by(maschine, charge) |>
  summarise(mm = mean(masse_mm, na.rm = TRUE), .groups = "drop") |>
  pivot_wider(names_from = maschine, values_from = mm)
chargen

d <- chargen$M3 - chargen$M1
d
#> 0,06250  0,03750  0,13083  0,02750  0,03750
#> 0,11000  0,04500  0,04750  0,07500  0,06000

# a) Vorzeichen
sum(d > 0)   #> 10 positiv
sum(d < 0)   #> 0 negativ  -> M3 liegt in jeder Charge ueber M1.

# b) Gepaarter t-Test
p31 <- t.test(chargen$M3, chargen$M1, paired = TRUE)
p31
#> t = 5,9822 | df = 9 | p = 0,000207
#> 95%-KI: [0,03938 ; 0,08728] | mittlere Differenz = 0,06333 mm

# c) Warum df = 9?
# Es gibt 10 Chargen und damit 10 Paare bzw. 10 Differenzen. Der gepaarte Test
# rechnet ausschliesslich mit diesen 10 Differenzen, daher df = n - 1 = 9.
# Die 37 bzw. 40 Einzelmessungen gehen nicht ein: die Streuung INNERHALB einer
# Charge wird herausgemittelt, die zwischencharge-Variation verschwindet in der
# Differenz. Weniger Werte, aber weniger Rauschen.

# d) t-Wert von Hand nachrechnen
t_aus_differenzen <- mean(d) / (sd(d) / sqrt(length(d)))
#> 0,063333 / (0,033479 / sqrt(10)) = 5,9822  <-- stimmt mit R ueberein

se_messwerte <- sqrt(kennzahlen$streuung[1]^2 / kennzahlen$n[1] +
                     kennzahlen$streuung[3]^2 / kennzahlen$n[3])
t_aus_messwerten <- (kennzahlen$mittel[3] - kennzahlen$mittel[1]) / se_messwerte
#> 0,06221 / 0,01217 = 5,1132  <-- das ist der UNGEEPAAARTE Welch-Wert, nicht der gepaarte

cat("t aus Differenzen:", t_aus_differenzen, "| t aus Messwerten:", t_aus_messwerten, "\n")
# Erkenntnis: Die gepaarte Formel benutzt die Standardabweichung der
# DIFFERENZEN (0,0335 mm), nicht die der Messwerte. Wer die Messwert-Streuung
# einsetzt, rechnet den falschen (ungepaarten) Test.


# =============================================================================
# "JETZT DU!" — M1 gegen M2 (aus der Lektion)
# =============================================================================

# Vorhersage: signifikant (p < 0,05), weil die Streuungen kleiner sind.
t12 <- t.test(masse_mm ~ maschine, data = daten |> filter(maschine %in% c("M1", "M2")))
t12
#> t = 2,8658 | df = 71,633 | p = 0,005456
#> 95%-KI (M1 - M2): [0,00719 ; 0,04005]

# M1 liegt demnach 0,0072 bis 0,0400 mm ueber M2 -- das ganze Intervall liegt
# weit innerhalb der Toleranz von +/- 0,15 mm. Trotz signifikantem p-Wert ist
# damit KEINE Maschine "besser" im wirtschaftlichen Sinn.

p12 <- t.test(chargen$M1, chargen$M2, paired = TRUE)
p12
#> 10 Paare | df = 9 | t = 3,1823 | p = 0,01114
#> 95%-KI: [0,00687 ; 0,04063] | mittlere Differenz = 0,02375 mm
#> Das KI ist etwas breiter als beim ungepaarten Test (weniger Freiheitsgrade),
#> aber die Paarung entfernt die Charge-Streuung und macht den Effekt trotzdem
#> nachweisbar.


# =============================================================================
# 4. KAPITEL-CHECK (Navarro, Kap. 13)
# =============================================================================

# a) Ein t-Test wird verwendet, wenn sigma der Grundgesamtheit unbekannt ist.
#    Man muss es aus der Stichprobe schaetzen (s). Diese Schaetzung ist selbst
#    unsicher -- vor allem bei kleinem n -- und macht den Nenner der Teststatistik
#    zu klein. Der t-Test traegt dem Rechnung, indem er die t-Verteilung mit
#    df = n - 1 verwendet: dickere Raender, groessere kritische Werte, also ein
#    konservativeres Urteil. Der z-Test setzt sigma als bekannt voraus und
#    "bezahlt" diese Ungewissheit nicht.

# b) Nein, der Kollege hat unrecht. p = 0,42 heisst nur: H0 wurde nicht
#    verworfen, ein Effekt war mit diesen Daten nicht nachweisbar -- das ist
#    fehlende Evidenz, kein Beleg fuer Gleichheit. Ein Fehler 2. Art (beta)
#    waere hier moeglich: Es koennte durchaus ein echter Unterschied bestehen,
#    den der Test wegen geringer Teststaerke (z. B. kleinem n oder grossem
#    Rauschen) nicht gefunden hat. Der Fehler 1. Art (alpha = 5 %) waere die
#    umgekehrte Situation: H0 wird verworfen, obwohl sie gilt.

# c) Drei Situationen, in denen gepaart getestet wird:
#    1. Dieselbe Maschine vor und nach einer Umstellung -> gepaart nach Maschine.
#    2. Zwei Messgeraete messen dasselbe Teil -> gepaart nach Teil.
#    3. Zwei Lieferanten-Chargen laufen in derselben Schicht / an demselben Tag
#       -> gepaart nach Charge bzw. Tag.
#    Immer gilt: Die Werte gehoeren paarweise zusammen, weil dieselbe Einheit
#    unter zwei Bedingungen gemessen wird.


# =============================================================================
# 5. DIE FRAGE HINTER DER AUFGABE
# =============================================================================

# a) Nein, das ist keine Basis fuer eine Prozessaenderung. Der Unterschied von
#    0,024 mm ist nur rund 16 % der Toleranz von +/- 0,15 mm, und das gesamte
#    Konfidenzintervall [0,0072 ; 0,0400] liegt innerhalb der Toleranz. Der
#    p-Wert sagt lediglich, dass diese Differenz bei n ~ 40 pro Maschine nicht
#    bloess Zufall ist -- er sagt nichts ueber den Nutzen einer Aenderung aus.

# b) "M1 und M2 unterscheiden sich signifikant" ist eine Aussage ueber die
#    EVIDENZ gegen H0 (p < 0,05). "M1 und M2 unterscheiden sich wirtschaftlich
#    nicht relevant" ist eine Aussage ueber die EFFEKTGROESSE im Verhaeltnis zu
#    Toleranz und Kosten. Das ist zweierlei: Die Staerke des Tests ist, dass er
#    auch kleine Effekte zuverlaessig findet; seine Grenze ist, dass p kein
#    Masstab fuer die Groesse des Effekts ist.

# c) Man sollte die ZAHL DER CHARGEN erhoehen, nicht nur die Teile pro Charge.
#    Bei gepaarter Betrachtung ist die Anzahl der Paare die wirksame Stichprobe:
#    mehr Chargen = mehr Differenzen = hoehere Freiheitsgrade (n-1) und ein
#    kleinerer Standardfehler der mittleren Differenz. Zusaetzliche Teile inner-
#    halb der bestehenden 10 Chargen machen die Chargenmittel nur noch minimal
#    genauer (dort wirkt der Mittelungs-Effekt bereits), aendern aber nichts an
#    den 10 Paaren -- abnehmender Grenzertrag.

# -----------------------------------------------------------------------------
# Feedback zur Lektion: siehe feedback.md
# -----------------------------------------------------------------------------
