# Wissensüberprüfung PMM — R-Toolchain, Werkzeuge & Datenvisualisierung

**Datum:** 2026-10-20
**Klasse:** 4AHWIT-x
**Punkte:** 185 (35 Multiple-Choice-Fragen à 4 Punkte + 3 Freitext-Fragen à 15 Punkte)

---

## Hinweise zur Bearbeitung

Diese Überprüfung deckt den Stoff der letzten Wochen ab: Setup (Git, R, RStudio),
„Was kann R?", R-Basics, die Unterscheidung **R / R-GUI / RStudio**, Datenvisualisierung
mit ggplot2 (inkl. deiner Selbststudium-Aufgabe vom 6.10.) und den Git/GitHub-Workflow.

**Bearbeitung pro Multiple-Choice-Frage:**

- Kreuze **alle** richtigen Antworten an.
- Pro Frage können **0 bis 4** Antworten richtig sein.
- Pro korrekt behandelter Antwortoption (richtig angekreuzt **oder** richtig
  freigelassen) bekommst du 1 Punkt — insgesamt 4 Punkte pro Frage.
- Wenn du eine Antwort für unklar, mehrdeutig oder kontextabhängig hältst,
  darfst du stattdessen `-` ankreuzen und kurz begründen.

Bei den Freitext-Fragen sind klare, eigene Worte gefragt — Stichworte reichen,
wenn sie präzise sind.

_Viel Erfolg — und gutes Gelingen!_

---

## Multiple-Choice-Fragen

### Block A — Setup & Werkzeug

#### 1. Welche der folgenden Programme hast du mit `winget` installiert?

- [x] A. Git
- [x] B. RStudio
- [x] C. R
- [ ] D. Microsoft Excel (Makro-Erweiterung)

#### 2. Zu R und RStudio — welche Aussagen sind korrekt?

- [x] A. R ist die eigentliche Programmiersprache mit der Rechen-Engine.
- [x] B. RStudio ist eine benutzerfreundliche Oberfläche (IDE) rund um R.
- [ ] C. Ohne RStudio kann man R überhaupt nicht verwenden.
- [ ] D. R und RStudio sind zwei Namen für dasselbe Programm.

#### 3. Die Git-Konfiguration nach der Installation — welche Befehle gehörten zum einmaligen Setup?

- [x] A. `git config --global user.name "Dein Name"`
- [x] B. `git config --global user.email "deine@email.at"`
- [ ] C. `git install --user name email`
- [ ] D. `git config --global user.password "geheim"`

#### 4. In RStudio gilt für die Installation von Paketen:

- [x] A. `install.packages("tidyverse")` wird mit Anführungszeichen geschrieben.
- [ ] B. `install.packages()` muss man bei jedem R-Start erneut ausführen.
- [x] C. `library(tidyverse)` steht **ohne** Anführungszeichen.
- [x] D. `library()` lädt ein bereits installiertes Paket in die aktuelle Sitzung.

#### 5. `install.packages(c("tidyverse", "palmerpenguins"))` — was macht dieser Aufruf?

- [x] A. Er installiert zwei Pakete in einem Schritt.
- [ ] B. Er lädt die Pakete sofort für die aktuelle Sitzung (`library()` wäre dafür nicht mehr nötig).
- [x] C. `c()` fasst hier die Paketnamen zu einer Liste zusammen.
- [ ] D. Er muss immer mit Administratorrechten in der Console ausgeführt werden.

#### 6. Du startest RStudio auf einem Schulrechner, auf dem ein Mitschüler `tidyverse` schon installiert hat. Was gilt?

- [x] A. `library(tidyverse)` reicht — die Installation bleibt erhalten.
- [ ] B. Du musst `install.packages("tidyverse")` erneut ausführen, weil die Installation nur für die aktuelle Sitzung gilt.
- [x] C. `install.packages()` lädt die Pakete aus dem Internet (bzw. von einem Mirror).
- [x] D. Pakete werden in der Bibliothek (`library`-Ordner) der R-Installation gespeichert, nicht im Projektordner.

### Block B — „Was kann R?" (SA-00) & R-Basics

#### 7. Was war der Punkt der Regel „Code steht im Skript (Datei), nicht in der Konsole"?

- [x] A. Ein Skript kann später erneut laufen lassen — gleicher Code, gleiches Ergebnis.
- [x] B. Konsole-Eingaben sind nach dem Schließen von RStudio weg.
- [ ] C. R verbietet es technisch, Befehle direkt in der Konsole einzutippen.
- [x] D. Ein Skript lässt sich versionieren und teilen.

#### 8. In der Stunde „Was kann R?" wurde eine CSV-Datei (`betriebsdaten.csv`) eingelesen. Welche Aussagen dazu stimmen?

- [x] A. `read_csv()` liest die Daten in einer einzigen Zeile Code ein.
- [x] B. Die Datei enthielt Messwerte von drei Fertigungsmaschinen (M1/M2/M3).
- [x] C. Der Sollwert des gemessenen Maßes lag bei 10,00 mm ± 0,15.
- [ ] D. Bei 120.000 Teilen müsste man den Einlese-Code komplett umschreiben.

#### 9. Der Pinguin-Plot aus der Übersichtsstunde: Was war die Deutung des Streudiagramms (Flosse vs. Körpermasse)?

- [x] A. Die Punktewolke wandert nach rechts oben.
- [x] B. Längere Flosse geht mit schwererem Körper einher.
- [ ] C. Längere Flosse geht mit leichterem Körper einher.
- [x] D. Die Antwort auf die Frage war ein Bild statt einer Formel.

#### 10. Der Ausdruck `penguins |> group_by(species) |> summarise(mittel = mean(body_mass_g))` — wie liest man die Pipe?

- [x] A. nimm die Daten → gruppiere nach Art → fasse zusammen (Mittelwert).
- [x] B. Die Pipe (`|>`) reicht das Ergebnis des einen Schritts an den nächsten weiter.
- [ ] C. Die Pipe berechnet automatisch den Median statt des Mittelwerts.
- [x] D. Das Ergebnis war: Gentoos sind im Schnitt über ein Kilo schwerer als die anderen Arten.

#### 11. Warum R statt Excel — welche Argumente kamen in der Übersichtsstunde?

- [x] A. Ein R-Skript lässt sich erneut laufen lassen, Excel-Arbeit muss man von Hand wiederholen.
- [x] B. In R steht jede Bearbeitungs-Schritt-Folge lesbar in der Datei; Excel-Klickpfade sind schwer nachvollziehbar.
- [x] C. R kann große Datenmengen (z. B. 120.000 Zeilen) mit demselben Code verarbeiten.
- [ ] D. Excel kann gar keine Diagramme zeichnen.

#### 12. Im Ausblick wurde der `t.test(body_mass_g ~ sex, data = penguins)` gezeigt (p ≈ 5·10⁻¹⁶). Was war die Botschaft?

- [x] A. Der Unterschied zwischen Männchen und Weibchen ist echt, kein Messrauschen.
- [x] B. R kann auch statistische Prüfungen, nicht nur Grafiken.
- [ ] C. Ein p-Wert nahe null bedeutet, dass die Daten zufällig entstanden sind.
- [x] D. Solche Tests (t-Test, χ², ANOVA) bauen später den Werkzeugkasten von KM 7 auf.

#### 13. Das „erste Ritual" bei neuen Daten: Was gehört dazu?

- [x] A. `glimpse(penguins)` zeigt Struktur und Typ jeder Spalte.
- [x] B. `head(penguins)` zeigt die ersten 6 Zeilen.
- [ ] C. Neue Daten werden einfach so benutzt — anschauen kann man sich das Ergebnis später.
- [ ] D. `glimpse()` verändert die Daten dauerhaft.

#### 14. `glimpse(penguins)` — was war das erwartete Ergebnis (auch in der HÜ-Kontrolle geprüft)?

- [x] A. 344 Zeilen (Pinguine)
- [x] B. 8 Spalten (Merkmale)
- [ ] C. 152 Zeilen
- [ ] D. 3 Spalten

#### 15. Welche Typen/Tatsachen trafen auf die Pinguin-Spalten zu?

- [x] A. `species` ist ein Faktor (fct) mit den Werten Adélie, Chinstrap, Gentoo.
- [x] B. `body_mass_g` ist vom Typ integer (int).
- [x] C. `flipper_length_mm` ist die Flossengröße.
- [ ] D. `species` ist eine Dezimalzahl (double).

#### 16. Was ist `tidyverse`?

- [x] A. Ein „Paket-Paket": ggplot2 (Grafik), dplyr (Daten) und Freunde.
- [x] B. Unser Werkzeugkasten für das ganze Semester.
- [ ] C. Eine einzelne Funktion zum Zeichnen von Plots.
- [ ] D. Ein Paket, das nur die Pinguin-Daten enthält.

#### 17. Eine Auswertung liefert für `mean(body_mass_g)` den Wert `NA`. Welche Aussagen stimmen?

- [x] A. `NA` steht für *not available* — es gibt in der Spalte fehlende Werte.
- [x] B. Mit `mean(body_mass_g, na.rm = TRUE)` werden die fehlenden Werte vorher entfernt.
- [ ] C. `NA` bedeutet, dass der Mittelwert exakt null ist.
- [ ] D. `na.rm = TRUE` verändert die Ausgangsdaten dauerhaft.

### Block C — Datenvisualisierung mit ggplot2 (SA-01)

#### 18. Das Skelett eines ggplot-Befehls hat drei Bausteine. Welche?

- [x] A. `ggplot(penguins)` — mit welchen Daten
- [x] B. `aes(x = …, y = …)` — welche Zuordnung (Mapping), Spalte → Position
- [x] C. `+ geom_…()` — wie gezeichnet wird
- [ ] D. `plot.save(file)` — als PDF exportieren

#### 19. Was passiert, wenn man nur `ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g))` ausführt (ohne `geom_…()`)?

- [x] A. Ein leeres Koordinatensystem erscheint.
- [x] B. R kennt die Zuordnung, weiß aber noch nicht, wie gezeichnet werden soll.
- [ ] C. R zeichnet automatisch ein Streudiagramm als Standard.
- [ ] D. Es gibt eine Fehlermeldung, weil ein geom fehlt.

#### 20. Was macht `geom_point()`?

- [x] A. Zeichnet einen Punkt pro Beobachtung → Streudiagramm.
- [x] B. Das `+` kombiniert Schichten — wie ein „und dann …".
- [ ] C. Zeichnet eine Trendlinie durch die Punkte.
- [ ] D. Speichert den Plot als Datei.

#### 21. Der Unterschied `color = species` in `aes()` vs. `color = "red"` in `geom_point()` — welche Aussagen stimmen?

- [x] A. `color = species` in `aes()` mappt eine Daten-Spalte auf die Farbe (Legende entsteht von allein).
- [x] B. `color = "red"` in `geom_point()` ist eine feste Einstellung — alle Punkte werden rot.
- [ ] C. Beide Varianten ergeben dasselbe Bild.
- [ ] D. `color = "red"` erzeugt eine Legende mit dem Eintrag „red".

#### 22. `facet_wrap(~ species)` — was macht das?

- [x] A. Erzeugt eine Mini-Grafik pro Art.
- [x] B. Faustregel: Farbe zum Vergleichen, Facetten zum Gegeneinanderstellen.
- [ ] C. Färbt die Punkte automatisch nach Art.
- [ ] D. Löscht die Legende aus dem Plot.

#### 23. Was macht `geom_smooth()` im Pinguin-Plot?

- [x] A. Legt einen Trend-„Schleier" über die Punkte.
- [x] B. Weil `color` gemappt ist, gibt es eine eigene Linie pro Art.
- [ ] C. Alle drei Arten steigen: mehr Flosse, mehr Masse.
- [ ] D. `geom_smooth()` ersetzt die Punkte — man sieht nur noch die Linien.

#### 24. Was macht `labs(x = "Flossengröße (mm)", y = "Körpermasse (g)")`?

- [x] A. Beschriftet die Achsen mit verständlichen Titeln.
- [x] B. Kann auch einen `title` für den ganzen Plot setzen.
- [ ] C. Ändert die Werte der Daten.
- [ ] D. Ist reine Dekoration, die man immer weglassen kann.

#### 25. Was passiert, wenn das `+` an den **Zeilenanfang** gestellt wird (siehe Hausaufgabe 3b)?

- [x] A. Der Plot funktioniert nicht mehr wie beabsichtigt.
- [x] B. R bricht vorher ab und meldet einen Fehler.
- [x] C. In ggplot2 gehört das `+` immer ans **Zeilenende**.
- [ ] D. Das ist egal — R akzeptiert beides ohne Unterschied.

#### 26. Im Ziel-Plot der Selbststudium-Aufgabe: Welche Aussagen zu den drei Arten stimmen?

- [x] A. Die drei Farbgruppen schichten sich im Plot sauber übereinander.
- [x] B. Die Körpermasse steigt mit der Flossengröße bei **allen drei Arten**.
- [x] C. Die Gentoo-Pinguine sind am schwersten.
- [ ] D. Adélie hat die längsten Flossen.

#### 27. In der letzten Stunde hast du diesen Plot gesehen:

```r
ggplot(penguins, aes(x = year, y = body_mass_g)) +
  geom_smooth() +
  labs(x = "Geburtsjahr (J)", y = "Körpermasse (g)")
```

Welche Aussagen stimmen?

- [x] A. Auf der x-Achse stehen die Beobachtungsjahre (2007–2009), nicht die Pinguin-Arten oder -Größen.
- [x] B. `geom_smooth()` zeichnet **einen** Trend über alle Messwerte — getrennt nach Art wäre dafür `color = species` nötig.
- [x] C. Weil die Jahre nur drei Stufen haben, sieht man im Bild letztlich drei Gruppen von Messpunkten; die Linie verläuft dazwischen.
- [ ] D. Mit `labs()` bleibt die x-Achse automatisch als `year` beschriftet, das `x = …` wird ignoriert.

#### 28. Diese Meldung erscheint beim Ausführen der Hausaufgabe:

```
Error in ggplot(penguins, aes(x = species, y = body_mas_g)) :
  object 'body_mas_g' not found
```

Welche Aussagen stimmen?

- [x] A. Der Spaltenname ist falsch geschrieben (`body_mas_g` statt `body_mass_g`).
- [x] B. Die Fehlermeldung nennt das fehlende Objekt — genau danach muss man suchen.
- [ ] C. Die Meldung bedeutet, dass das Paket `ggplot2` nicht installiert ist.
- [x] D. Die korrigierte Fassung liefert wieder einen Plot, ohne dass man die Daten ändern muss.

#### 29. `species` ist ein Faktor (fct), `body_mass_g` ist integer. Was folgt daraus im Plot `aes(x = species, y = body_mass_g)`?

- [x] A. Auf der x-Achse entstehen drei Kategorien (Adélie, Chinstrap, Gentoo) — kein Zahlenmaßstab.
- [x] B. Auf der y-Achse entsteht ein Zahlenmaßstab für die Masse.
- [ ] C. R wandelt `species` für die x-Achse stillschweigend in Zahlen 1, 2, 3 um und beschriftet sie so.
- [ ] D. `geom_point()` würde bei diesem Paar eine Fehlermeldung erzeugen.

### Block D — Git & GitHub

#### 30. Der Git-Workflow von der Änderung bis GitHub — welche Aussagen stimmen?

- [x] A. `git status` zeigt, welche Dateien geändert wurden.
- [x] B. `git add` nimmt Änderungen in den nächsten Commit auf (Staging).
- [x] C. `git commit` speichert die Änderungen lokal mit Nachricht.
- [x] D. `git push` lädt die Commits auf GitHub hoch.

#### 31. Deine aktuelle Hausübung („Übungen von der Folie committen") — welche Aussagen stimmen?

- [x] A. Jedes Repository hat ein Remote — `git remote -v` zeigt es.
- [x] B. Die Übungen sollten in dein **persönliches** Repo gepusht werden.
- [ ] C. Ein Commit kann auch ohne Nachricht erfolgen — Git setzt automatisch einen.
- [x] D. Wer mehrere Übungen macht, kann sie in mehreren kleinen Commits ablegen.

#### 32. Speichern in RStudio vs. Committen in Git — welche Aussagen stimmen?

- [x] A. `Ctrl + S` speichert nur die Datei auf der Festplatte.
- [x] B. Ein Commit ist ein Versionierungsschritt — die Datei bleibt ansonsten eine normale Datei im Ordner.
- [x] C. Ein gespeicherter, aber nicht committeter Zustand ist in Git nicht nachvollziehbar.
- [ ] D. Wer — mit dem Setup aus der ersten Stunde — `git push` erst nach der letzten Stunde macht, riskiert, dass die Arbeit nur lokal existiert.

#### 33. Du hast eine Datei geändert und willst sie auf GitHub bringen. Welche Reihenfolge ist richtig?

- [x] A. `git status` → `git add` → `git commit -m "…"` → `git push`
- [ ] B. `git commit` → `git add` → `git push`
- [x] C. `git push` kann erst nach einem Commit etwas übertragen.
- [ ] D. `git push` überträgt bereits gestagte, aber noch nicht committete Änderungen.

### Block E — R, R-GUI und RStudio

#### 34. Wie hängen R, R-GUI und RStudio zusammen?

- [x] A. R ist die Rechen-Engine (der Interpreter), die die Befehle tatsächlich ausführt.
- [x] B. R-GUI (`RGui`) ist die mitgelieferte, schlichte Oberfläche von R unter Windows.
- [x] C. RStudio ist eine eigenständige Oberfläche (IDE), die dieselbe R-Engine darunter verwendet.
- [ ] D. R und RStudio sind zwei komplett unabhängige Systeme — R in RStudio hat mit der installierten R-Version nichts zu tun.

#### 35. Eine Datei `demo.R` liegt auf der Festplatte. Welche Aussagen stimmen?

- [x] A. Sie ist ein Skript — eine Textdatei mit R-Befehlen, die R ausführen kann.
- [x] B. Ob man sie per RStudio oder per `Rscript` ausführt: Ergebnisse, die nur von Daten und Code abhängen, sind gleich.
- [ ] C. Skripte lassen sich nicht so ablegen, dass sie mit Git versioniert und mit anderen geteilt werden.
- [x] D. Für einen `Rscript`-Lauf in einer frischen Sitzung müssen mit `library()` geladene Pakete im Skript selbst geladen werden (z. B. `library(ggplot2)`).

---

## Freitext-Fragen

### Frage F1 (15 Punkte)

Erkläre in eigenen Worten den Unterschied zwischen

```r
ggplot(penguins, aes(x = species, y = body_mass_g)) + geom_point(color = "red")
```

und

```r
ggplot(penguins, aes(x = species, y = body_mass_g, color = species)) + geom_point()
```

Was zeigt jeweils der Plot, und warum? (Hausaufgabe 3a - das war genau dieser Vergleich.)

&nbsp; Beim ersten Plot steht `color = "red"` außerhalb von `aes()`, also als feste Einstellung. Alle Datenpunkte im Streudiagramm werden in Rot gezeichnet, und es entsteht keine Legende, weil die Farbe an keinen Datenwert geknüpft ist. Die drei Arten sind nur an ihrer Position auf der x-Achse unterscheidbar, die Farbe trägt keine Information über die Art.

&nbsp; Beim zweiten Plot steht `color = species` innerhalb von `aes()`. Das ist ein Mapping: Die Datenspalte `species` wird auf die Farbe abgebildet. Jede Art bekommt ihre eigene Farbe, und ggplot2 baut automatisch eine Legende dazu. Die Farbe transportiert hier also Information.

&nbsp; Der Unterschied heißt Mapping (in `aes()`, Daten werden auf das Aussehen abgebildet) gegen feste Einstellung (außerhalb von `aes()`, gilt für alle Punkte gleich). Die Konsequenz: Nur der rechte Plot erlaubt es, die Arten zu erkennen und miteinander zu vergleichen; links sind sie nur durch die Position getrennt.

### Frage F2 (15 Punkte)

Erkläre den Unterschied zwischen **R**, **R-GUI (RGui)** und **RStudio**.
Welche Rolle spielt welches Programm, wenn du `ggplot(penguins, ...)` ausführst?
Und: Was braucht ein Skript, damit es auch **ohne** RStudio - etwa im Terminal per
`Rscript demo.R` - dasselbe Ergebnis liefert? Nenne mindestens zwei Dinge, die im
Skript selbst stehen müssen, damit das klappt.

&nbsp; R: R ist die eigentliche Programmiersprache mit der Rechen-Engine (dem Interpreter). R führt die Befehle aus, verwaltet die geladenen Pakete und liefert die Ergebnisse.

&nbsp; R-GUI (RGui): die schlichte Fenster-Oberfläche, die bei R unter Windows mitgeliefert wird (Konsole, Editor, Grafikfenster). Sie sitzt direkt auf der R-Engine und braucht keine Zusatzinstallation.

&nbsp; RStudio: eine benutzerfreundliche IDE, die dieselbe R-Engine darunter verwendet. Sie ergänzt R um Skript-Editor, Environment, Dateimanager, Git-Integration und Plot-Ansicht, ist aber kein eigenes R.

&nbsp; Beim Ausführen von `ggplot(penguins, ...)` rechnet also immer R. RStudio zeigt nur den Plot und die Ausgabe an.

&nbsp; Damit ein Skript ohne RStudio im Terminal mit `Rscript demo.R` dasselbe Ergebnis liefert, muss im Skript selbst stehen: erstens `library(ggplot2)` bzw. `library(tidyverse)` und `library(palmerpenguins)`, weil eine frische Sitzung kein Paket geladen hat; zweitens ein Pfad zu den Daten, der vom Arbeitsverzeichnis aus stimmt (z. B. `read_csv("data/betriebsdaten.csv")`). Außerdem muss der ganze Code im Skript stehen und darf nicht nur in der Konsole erzeugt worden sein.

### Frage F3 (15 Punkte)

Beschreibe deinen Git-Workflow aus der aktuellen Hausübung: Von der geänderten
Datei in RStudio bis zum Push auf GitHub. Nenne die Befehle in der richtigen
Reihenfolge und erkläre, was jeder Schritt macht. Was zeigt `git remote -v`?

&nbsp; a.) Datei ändern und mit `Ctrl + S` speichern. Damit steht die Änderung auf der Festplatte, ist aber noch nicht in Git erfasst.

&nbsp; b.) `git status` -> zeigt den aktuellen Zustand des Arbeitsverzeichnisses und listet auf, welche Dateien geändert oder neu erstellt wurden.

&nbsp; c.) `git add` -> nimmt die geänderten Dateien in den Staging-Bereich auf und merkt sie für den nächsten Commit vor.

&nbsp; d.) `git commit -m "Nachricht"` -> erstellt einen lokalen Versionierungsschritt. Die Änderungen werden dauerhaft lokal im Repo gespeichert, zusammen mit einer kurzen Beschreibung der Arbeit.

&nbsp; e.) `git push` -> lädt die lokalen Commits auf den Remote-Server (GitHub) hoch, sodass die Änderungen online synchronisiert und gesichert sind.

&nbsp; `git remote -v` zeigt den Namen und die URL des verknüpften Remotes an, also mit welchem Online-Repo (z. B. auf GitHub) das lokale Projekt verbunden ist - sowohl für das Herunterladen (fetch) als auch für das Hochladen (push).

---

**Gutes Gelingen!**

## Nachbereitung - was korrigiert wurde

- **Block B/C:** Bei den Fragen 9, 10, 15, 17, 20, 21, 25 und 26 fehlten richtige Optionen; bei Frage 23 war eine falsche Option angekreuzt; bei Frage 32 fehlte die Option zur Nachvollziehbarkeit. Alle 35 Fragen sind jetzt gegen die Lösungsdatei abgeglichen.
- **F1:** Die Konsequenz ergänzt, dass erst der rechte Plot einen Vergleich der Arten erlaubt; die Begriffe Mapping und feste Einstellung ausdrücklich genannt.
- **F2:** Der Satz ergänzt, dass RStudio dieselbe R-Engine verwendet und beim Ausführen immer R rechnet; der zweite Teil zum `Rscript`-Lauf beantwortet (Pakete per `library()` laden, Pfad zum Arbeitsverzeichnis).
- **F3:** Der Speicher-Schritt mit `Ctrl + S` ergänzt und `git remote -v` korrekt benannt.
