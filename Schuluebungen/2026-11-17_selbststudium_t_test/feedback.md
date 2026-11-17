# Feedback zur Lektion KM7-01 — Mittelwertsvergleich: z-Test und t-Test

Datum: 17.11.2026 · Suad Bajraktarovic

## Was sehr gut ist

- Der rote Faden **Effekt vs. Rauschen** macht verständlich, warum ein t-Test überhaupt rechnet.
- Die permanent wiederholte Warnung **„p ≥ 0,05 ist kein Beleg für Gleichheit"** ist genau die Stelle, an der die meisten Leute hängen bleiben.
- Das Konfidenzintervall wird konsequent **vor** dem p-Wert ernst genommen — das ist die ehrlichere Lesart.
- Die Herleitung der **gepaarten Formel über die Differenzen** (inkl. „Nenner = SD der Differenzen, nicht der Messwerte") ist klar und nimmt den häufigsten Fehler vorweg.
- Die Quizzes mit Begründungen für richtige *und* falsche Antworten sind eine starke Wiederholung.

## Konkrete Hinweise / Stellen zum Korrigieren

1. **Fachlicher Fehler (wichtig):** Im Callout „Warum df = 9?" und in Schritt 5 heisst es
   *„Beim ungepaarten Test waren es 37 + 39 − 2 = 74 (bzw. 55,272 bei Welch)."*
   Verglichen wird aber M1 gegen M3 — also **37 + 40 − 2 = 75**. Die 39 ist die Fallzahl von M2.
   Die 55,272 ist ebenfalls der Welch-df von M1/M3. Bitte auf **75** korrigieren.

2. **Einstiegsfrage:** „Aus je 40 Messungen" stimmt so nicht. Es sind 37 / 39 / 40 gültige Werte, weil vier Messungen fehlen. Besser: *„Aus bis zu 40 Messungen je Maschine (vier Werte fehlen)."*

3. **z-Test-Beispiel:** Der Text sagt „Du weißt die Grundgesamtheits-Streuung σ genau", rechnet dann aber mit den Stichproben-Streuungen 0,0315 und 0,0696. Das ist didaktisch verwirrend. Bitte explizit sagen: *„Hier setzen wir s nur als Platzhalter ein, um die Formel zu zeigen — streng genommen ist das dann schon ein t-Test."*

4. **Einseitiger Test:** „Ist M3 jetzt GRÖSSER als M1?" mit `alternative = "less"` ist rechnerisch richtig (R bildet M1 − M3), aber für Lernende irritierend. Ein kurzer Hinweis auf das Vorzeichen der Differenz würde helfen.

5. **Formulierung:** „Der gepaarte Test hat weniger Freiheitsgrade, obwohl er **mehr Information nutzt**" — er nutzt nicht mehr Daten, sondern die *Zuordnungsinformation* der Paare. „Dieselbe Information besser nutzt" wäre präziser.

6. **Footer-Link:** „Weiter: Lektion KM5-02 — Binomialverteilung" passt nicht in die KM7-Reihe; vermutlich ist **KM7-02 (Chi-Quadrat-Test)** gemeint.

7. **Aufgabenblatt vs. README:** `aufgabe.md` verlangt ein Projekt `pmm-km7-01`, die aktuelle README verlangt ISO-8601-Ordnernamen. Bitte vereinheitlichen (z. B. `2026-11-17_selbststudium_t_test`).

8. **Quiz q7:** „40 linke und 40 rechte Stoßfänger derselben Tagesschicht" ist als Paarungsbeispiel schwach — die Paarung wird klarer, wenn links/rechts **desselben Fahrzeugs** (oder derselben Form) stammen.

## Fazit

Sehr gelungene Lektion; die oben genannten Punkte sind überwiegend kleine Präzisierungen. Der eine Zahlenfehler (74 statt 75) sollte aber korrigiert werden, weil er direkt an die Freiheitsgrade anknüpft, die die Lektion gerade erklärt.
