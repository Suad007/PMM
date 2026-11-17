library(ggplot2)
library(palmerpenguins)

# Demo aus der Stunde: eine Trendlinie über alle Arten
ggplot(penguins,
       aes(x = year, y = body_mass_g)) +
  geom_smooth() +
  labs(x = "Geburtsjahr (J)", y = "Körpermasse (g)")

# Ergänzung: Art als Farbe, eigene Facette je Art, Titel
ggplot(penguins,
       aes(x = year, y = body_mass_g, color = species)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ species) +
  labs(x = "Geburtsjahr (J)", y = "Körpermasse (g)",
       color = "Art",
       title = "Körpermasse der Pinguine nach Art (2007-2009)")
