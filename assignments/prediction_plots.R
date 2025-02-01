#repeat this for each month
#good luck
#must decide if you want the whole bottom row to
  #be one stretched nowcast or two identical square nowcasts

Jan_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_g_Jan['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})


Jan_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Jan['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Jan_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Jan['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Jan_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Jan['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Jan_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Jan['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Jan_now_title <- add_title("Nowcast") / Jan_now + plot_layout(heights = c(0.07, 1))
Jan_rcp45_75_title <- add_title("RCP45 2075") / Jan_rcp45_75 + plot_layout(heights = c(0.07, 1))
Jan_rcp85_75_title <- add_title("RCP85 2075") / Jan_rcp85_75 + plot_layout(heights = c(0.07, 1))
Jan_rcp45_55_title <- add_title("RCP45 2055") / Jan_rcp45_55 + plot_layout(heights = c(0.07, 1))
Jan_rcp85_55_title <- add_title("RCP85 2055") / Jan_rcp85_55 + plot_layout(heights = c(0.07, 1))

JanComp <- (
  (Jan_rcp45_75_title | Jan_rcp85_75_title) /
    (Jan_rcp45_55_title | Jan_rcp85_55_title) /
    (Jan_now_title | Jan_now_title))

JanComp

ggsave("JanComp.png", plot = JanComp, width = 8, height = 6, units = "in", dpi = 300)

#February
Feb_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_g_Feb['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Feb_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Feb['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Feb_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Feb['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Feb_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Feb['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Feb_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Feb['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Feb_now_title <- add_title("Nowcast") / Feb_now + plot_layout(heights = c(0.05, 1))
Feb_rcp45_75_title <- add_title("RCP45 2075") / Feb_rcp45_75 + plot_layout(heights = c(0.05, 1))
Feb_rcp85_75_title <- add_title("RCP85 2075") / Feb_rcp85_75 + plot_layout(heights = c(0.05, 1))
Feb_rcp45_55_title <- add_title("RCP45 2055") / Feb_rcp45_55 + plot_layout(heights = c(0.05, 1))
Feb_rcp85_55_title <- add_title("RCP85 2055") / Feb_rcp85_55 + plot_layout(heights = c(0.05, 1))

FebComp <- (
  (Feb_rcp45_75_title | Feb_rcp85_75_title) /
    (Feb_rcp45_55_title | Feb_rcp85_55_title) /
    (Feb_now_title | Feb_now_title))

FebComp
ggsave("FebComp.png", plot = FebComp, width = 8, height = 6, units = "in", dpi = 300)

#March
Mar_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_g_Mar['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})


Mar_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Mar['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Mar_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Mar['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Mar_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Mar['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Mar_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Mar['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Mar_now_title <- add_title("Nowcast") / Mar_now + plot_layout(heights = c(0.05, 1))
Mar_rcp45_75_title <- add_title("RCP45 2075") / Mar_rcp45_75 + plot_layout(heights = c(0.05, 1))
Mar_rcp85_75_title <- add_title("RCP85 2075") / Mar_rcp85_75 + plot_layout(heights = c(0.05, 1))
Mar_rcp45_55_title <- add_title("RCP45 2055") / Mar_rcp45_55 + plot_layout(heights = c(0.05, 1))
Mar_rcp85_55_title <- add_title("RCP85 2055") / Mar_rcp85_55 + plot_layout(heights = c(0.05, 1))

MarComp <- (
  (Mar_rcp45_75_title | Mar_rcp85_75_title) /
    (Mar_rcp45_55_title | Mar_rcp85_55_title) /
    (Mar_now_title | Mar_now_title))

MarComp
ggsave("MarComp.png", plot = MarComp, width = 8, height = 6, units = "in", dpi = 300)

#April
Apr_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Apr['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})


Apr_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Apr['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Apr_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Apr['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Apr_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Apr['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Apr_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Apr['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Apr_now_title <- add_title("Nowcast") / Apr_now + plot_layout(heights = c(0.05, 1))
Apr_rcp45_75_title <- add_title("RCP45 2075") / Apr_rcp45_75 + plot_layout(heights = c(0.05, 1))
Apr_rcp85_75_title <- add_title("RCP85 2075") / Apr_rcp85_75 + plot_layout(heights = c(0.05, 1))
Apr_rcp45_55_title <- add_title("RCP45 2055") / Apr_rcp45_55 + plot_layout(heights = c(0.05, 1))
Apr_rcp85_55_title <- add_title("RCP85 2055") / Apr_rcp85_55 + plot_layout(heights = c(0.05, 1))

AprComp <- (
  (Apr_rcp45_75_title | Apr_rcp85_75_title) /
    (Apr_rcp45_55_title | Apr_rcp85_55_title) /
    (Apr_now_title | Apr_now_title))

AprComp
ggsave("AprComp.png", plot = AprComp, width = 8, height = 6, units = "in", dpi = 300)


#May
May_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_May['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})


May_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_May['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

May_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_May['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

May_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_May['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

May_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_May['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

May_now_title <- add_title("Nowcast") / May_now + plot_layout(heights = c(0.05, 1))
May_rcp45_75_title <- add_title("RCP45 2075") / May_rcp45_75 + plot_layout(heights = c(0.05, 1))
May_rcp85_75_title <- add_title("RCP85 2075") / May_rcp85_75 + plot_layout(heights = c(0.05, 1))
May_rcp45_55_title <- add_title("RCP45 2055") / May_rcp45_55 + plot_layout(heights = c(0.05, 1))
May_rcp85_55_title <- add_title("RCP85 2055") / May_rcp85_55 + plot_layout(heights = c(0.05, 1))

MayComp <- (
  (May_rcp45_75_title | May_rcp85_75_title) /
    (May_rcp45_55_title | May_rcp85_55_title) /
    (May_now_title | May_now_title))

MayComp

ggsave("MayComp.png", plot = MayComp, width = 8, height = 6, units = "in", dpi = 300)


#June
Jun_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Jun['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})


Jun_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Jun['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Jun_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Jun['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Jun_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Jun['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Jun_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Jun['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Jun_now_title <- add_title("Nowcast") / Jun_now + plot_layout(heights = c(0.05, 1))
Jun_rcp45_75_title <- add_title("RCP45 2075") / Jun_rcp45_75 + plot_layout(heights = c(0.05, 1))
Jun_rcp85_75_title <- add_title("RCP85 2075") / Jun_rcp85_75 + plot_layout(heights = c(0.05, 1))
Jun_rcp45_55_title <- add_title("RCP45 2055") / Jun_rcp45_55 + plot_layout(heights = c(0.05, 1))
Jun_rcp85_55_title <- add_title("RCP85 2055") / Jun_rcp85_55 + plot_layout(heights = c(0.05, 1))

JunComp <- (
  (Jun_rcp45_75_title | Jun_rcp85_75_title) /
    (Jun_rcp45_55_title | Jun_rcp85_55_title) /
    (Jun_now_title | Jun_now_title))

JunComp
ggsave("JunComp.png", plot = JunComp, width = 8, height = 6, units = "in", dpi = 300)


#July
Jul_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Jul['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})


Jul_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Jul['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Jul_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Jul['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Jul_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Jul['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Jul_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Jul['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Jul_now_title <- add_title("Nowcast") / Jul_now + plot_layout(heights = c(0.05, 1))
Jul_rcp45_75_title <- add_title("RCP45 2075") / Jul_rcp45_75 + plot_layout(heights = c(0.05, 1))
Jul_rcp85_75_title <- add_title("RCP85 2075") / Jul_rcp85_75 + plot_layout(heights = c(0.05, 1))
Jul_rcp45_55_title <- add_title("RCP45 2055") / Jul_rcp45_55 + plot_layout(heights = c(0.05, 1))
Jul_rcp85_55_title <- add_title("RCP85 2055") / Jul_rcp85_55 + plot_layout(heights = c(0.05, 1))

JulComp <- (
  (Jul_rcp45_75_title | Jul_rcp85_75_title) /
    (Jul_rcp45_55_title | Jul_rcp85_55_title) /
    (Jul_now_title | Jul_now_title))

JulComp

ggsave("JulComp.png", plot = JulComp, width = 8, height = 6, units = "in", dpi = 300)

#August
Aug_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Aug['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})


Aug_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Aug['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Aug_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Aug['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Aug_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Aug['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Aug_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Aug['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Aug_now_title <- add_title("Nowcast") / Aug_now + plot_layout(heights = c(0.05, 1))
Aug_rcp45_75_title <- add_title("RCP45 2075") / Aug_rcp45_75 + plot_layout(heights = c(0.05, 1))
Aug_rcp85_75_title <- add_title("RCP85 2075") / Aug_rcp85_75 + plot_layout(heights = c(0.05, 1))
Aug_rcp45_55_title <- add_title("RCP45 2055") / Aug_rcp45_55 + plot_layout(heights = c(0.05, 1))
Aug_rcp85_55_title <- add_title("RCP85 2055") / Aug_rcp85_55 + plot_layout(heights = c(0.05, 1))

AugComp <- (
  (Aug_rcp45_75_title | Aug_rcp85_75_title) /
    (Aug_rcp45_55_title | Aug_rcp85_55_title) /
    (Aug_now_title | Aug_now_title))

AugComp
ggsave("AugComp.png", plot = AugComp, width = 8, height = 6, units = "in", dpi = 300)

#September
Sep_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Sep['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})


Sep_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Sep['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Sep_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Sep['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Sep_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Sep['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Sep_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Sep['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Sep_now_title <- add_title("Nowcast") / Sep_now + plot_layout(heights = c(0.05, 1))
Sep_rcp45_75_title <- add_title("RCP45 2075") / Sep_rcp45_75 + plot_layout(heights = c(0.05, 1))
Sep_rcp85_75_title <- add_title("RCP85 2075") / Sep_rcp85_75 + plot_layout(heights = c(0.05, 1))
Sep_rcp45_55_title <- add_title("RCP45 2055") / Sep_rcp45_55 + plot_layout(heights = c(0.05, 1))
Sep_rcp85_55_title <- add_title("RCP85 2055") / Sep_rcp85_55 + plot_layout(heights = c(0.05, 1))

SepComp <- (
  (Sep_rcp45_75_title | Sep_rcp85_75_title) /
    (Sep_rcp45_55_title | Sep_rcp85_55_title) /
    (Sep_now_title | Sep_now_title))

SepComp

ggsave("SepComp.png", plot = SepComp, width = 8, height = 6, units = "in", dpi = 300)


#October
Oct_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Oct['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})


Oct_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Oct['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Oct_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Oct['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Oct_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Oct['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Oct_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Oct['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Oct_now_title <- add_title("Nowcast") / Oct_now + plot_layout(heights = c(0.05, 1))
Oct_rcp45_75_title <- add_title("RCP45 2075") / Oct_rcp45_75 + plot_layout(heights = c(0.05, 1))
Oct_rcp85_75_title <- add_title("RCP85 2075") / Oct_rcp85_75 + plot_layout(heights = c(0.05, 1))
Oct_rcp45_55_title <- add_title("RCP45 2055") / Oct_rcp45_55 + plot_layout(heights = c(0.05, 1))
Oct_rcp85_55_title <- add_title("RCP85 2055") / Oct_rcp85_55 + plot_layout(heights = c(0.05, 1))

OctComp <- (
  (Oct_rcp45_75_title | Oct_rcp85_75_title) /
    (Oct_rcp45_55_title | Oct_rcp85_55_title) /
    (Oct_now_title | Oct_now_title))

OctComp

ggsave("OctComp.png", plot = OctComp, width = 8, height = 6, units = "in", dpi = 300)



#November
Nov_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_g_Nov['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})


Nov_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Nov['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Nov_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Nov['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Nov_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Nov['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Nov_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Nov['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Nov_now_title <- add_title("Nowcast") / Nov_now + plot_layout(heights = c(0.05, 1))
Nov_rcp45_75_title <- add_title("RCP45 2075") / Nov_rcp45_75 + plot_layout(heights = c(0.05, 1))
Nov_rcp85_75_title <- add_title("RCP85 2075") / Nov_rcp85_75 + plot_layout(heights = c(0.05, 1))
Nov_rcp45_55_title <- add_title("RCP45 2055") / Nov_rcp45_55 + plot_layout(heights = c(0.05, 1))
Nov_rcp85_55_title <- add_title("RCP85 2055") / Nov_rcp85_55 + plot_layout(heights = c(0.05, 1))

NovComp <- (
  (Nov_rcp45_75_title | Nov_rcp85_75_title) /
    (Nov_rcp45_55_title | Nov_rcp85_55_title) /
    (Nov_now_title | Nov_now_title))

NovComp

ggsave("NovComp.png", plot = NovComp, width = 8, height = 6, units = "in", dpi = 300)


#December
Dec_now <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_g_Dec['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Dec_rcp45_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Dec['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Dec_rcp85_75 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Dec['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Dec_rcp45_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Dec['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

Dec_rcp85_55 <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Dec['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

Dec_now_title <- add_title("Nowcast") / Dec_now + plot_layout(heights = c(0.05, 1))
Dec_rcp45_75_title <- add_title("RCP45 2075") / Dec_rcp45_75 + plot_layout(heights = c(0.05, 1))
Dec_rcp85_75_title <- add_title("RCP85 2075") / Dec_rcp85_75 + plot_layout(heights = c(0.05, 1))
Dec_rcp45_55_title <- add_title("RCP45 2055") / Dec_rcp45_55 + plot_layout(heights = c(0.05, 1))
Dec_rcp85_55_title <- add_title("RCP85 2055") / Dec_rcp85_55 + plot_layout(heights = c(0.05, 1))

DecComp <- (
  (Dec_rcp45_75_title | Dec_rcp85_75_title) /
    (Dec_rcp45_55_title | Dec_rcp85_55_title) /
    (Dec_now_title | Dec_now_title))

DecComp

ggsave("DecComp.png", plot = DecComp, width = 8, height = 6, units = "in", dpi = 300)


#Monthly RCP45 2055
rcp45_2055_Jan <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Jan['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_Feb <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Feb['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_Mar <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Mar['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_Apr <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Apr['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_May <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_May['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_Jun <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Jun['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_Jul <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Jul['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_Aug <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Aug['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_Sep <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Sep['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_Oct <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Oct['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_Nov <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Nov['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2055_Dec <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2055_Dec['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

rcp45_2055_Jan_title <- add_title("January") / rcp45_2055_Jan + plot_layout(heights = c(0.09, 1))
rcp45_2055_Feb_title <- add_title("February") / rcp45_2055_Feb + plot_layout(heights = c(0.09, 1))
rcp45_2055_Mar_title <- add_title("March") / rcp45_2055_Mar + plot_layout(heights = c(0.09, 1))
rcp45_2055_Apr_title <- add_title("April") / rcp45_2055_Apr + plot_layout(heights = c(0.09, 1))
rcp45_2055_May_title <- add_title("May") / rcp45_2055_May + plot_layout(heights = c(0.09, 1))
rcp45_2055_Jun_title <- add_title("June") / rcp45_2055_Jun + plot_layout(heights = c(0.09, 1))
rcp45_2055_Jul_title <- add_title("July") / rcp45_2055_Jul + plot_layout(heights = c(0.09, 1))
rcp45_2055_Aug_title <- add_title("August") / rcp45_2055_Aug + plot_layout(heights = c(0.09, 1))
rcp45_2055_Sep_title <- add_title("September") / rcp45_2055_Sep + plot_layout(heights = c(0.09, 1))
rcp45_2055_Oct_title <- add_title("October") / rcp45_2055_Oct + plot_layout(heights = c(0.09, 1))
rcp45_2055_Nov_title <- add_title("November") / rcp45_2055_Nov + plot_layout(heights = c(0.09, 1))
rcp45_2055_Dec_title <- add_title("December") / rcp45_2055_Dec + plot_layout(heights = c(0.09, 1))

RCP45_2055_monthly <- (
  (rcp45_2055_Dec_title | rcp45_2055_Jan_title | rcp45_2055_Feb_title) /
    (rcp45_2055_Mar_title | rcp45_2055_Apr_title | rcp45_2055_May_title) /
    (rcp45_2055_Jun_title | rcp45_2055_Jul_title | rcp45_2055_Aug_title) /
    (rcp45_2055_Sep_title | rcp45_2055_Oct_title | rcp45_2055_Nov_title))

RCP45_2055_monthly

ggsave(filename = "RCP45_2055_monthly.png", plot = RCP45_2055_monthly, width = 8, height = 8, units = "in", dpi = 300)


#RCP85 Monthly
rcp85_2055_Jan <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Jan['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_Feb <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Feb['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_Mar <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Mar['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_Apr <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Apr['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_May <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_May['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_Jun <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Jun['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_Jul <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Jul['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_Aug <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Aug['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_Sep <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Sep['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_Oct <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Oct['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_Nov <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Nov['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2055_Dec <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2055_Dec['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

rcp85_2055_Jan_title <- add_title("January") / rcp85_2055_Jan + plot_layout(heights = c(0.09, 1))
rcp85_2055_Feb_title <- add_title("February") / rcp85_2055_Feb + plot_layout(heights = c(0.09, 1))
rcp85_2055_Mar_title <- add_title("March") / rcp85_2055_Mar + plot_layout(heights = c(0.09, 1))
rcp85_2055_Apr_title <- add_title("April") / rcp85_2055_Apr + plot_layout(heights = c(0.09, 1))
rcp85_2055_May_title <- add_title("May") / rcp85_2055_May + plot_layout(heights = c(0.09, 1))
rcp85_2055_Jun_title <- add_title("June") / rcp85_2055_Jun + plot_layout(heights = c(0.09, 1))
rcp85_2055_Jul_title <- add_title("July") / rcp85_2055_Jul + plot_layout(heights = c(0.09, 1))
rcp85_2055_Aug_title <- add_title("August") / rcp85_2055_Aug + plot_layout(heights = c(0.09, 1))
rcp85_2055_Sep_title <- add_title("September") / rcp85_2055_Sep + plot_layout(heights = c(0.09, 1))
rcp85_2055_Oct_title <- add_title("October") / rcp85_2055_Oct + plot_layout(heights = c(0.09, 1))
rcp85_2055_Nov_title <- add_title("November") / rcp85_2055_Nov + plot_layout(heights = c(0.09, 1))
rcp85_2055_Dec_title <- add_title("December") / rcp85_2055_Dec + plot_layout(heights = c(0.09, 1))

rcp85_2055_monthly <- (
  (rcp85_2055_Dec_title | rcp85_2055_Jan_title | rcp85_2055_Feb_title) /
    (rcp85_2055_Mar_title | rcp85_2055_Apr_title | rcp85_2055_May_title) /
    (rcp85_2055_Jun_title | rcp85_2055_Jul_title | rcp85_2055_Aug_title) /
    (rcp85_2055_Sep_title | rcp85_2055_Oct_title | rcp85_2055_Nov_title))

rcp85_2055_monthly

ggsave(filename = "rcp85_2055_monthly.png", plot = rcp85_2055_monthly, width = 8, height = 8, units = "in", dpi = 300)

#RCP45 2075

rcp45_2075_Jan <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Jan['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_Feb <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Feb['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_Mar <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Mar['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_Apr <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Apr['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_May <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_May['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_Jun <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Jun['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_Jul <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Jul['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_Aug <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Aug['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_Sep <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Sep['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_Oct <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Oct['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_Nov <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Nov['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp45_2075_Dec <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp45_2075_Dec['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

rcp45_2075_Jan_title <- add_title("January") / rcp45_2075_Jan + plot_layout(heights = c(0.09, 1))
rcp45_2075_Feb_title <- add_title("February") / rcp45_2075_Feb + plot_layout(heights = c(0.09, 1))
rcp45_2075_Mar_title <- add_title("March") / rcp45_2075_Mar + plot_layout(heights = c(0.09, 1))
rcp45_2075_Apr_title <- add_title("April") / rcp45_2075_Apr + plot_layout(heights = c(0.09, 1))
rcp45_2075_May_title <- add_title("May") / rcp45_2075_May + plot_layout(heights = c(0.09, 1))
rcp45_2075_Jun_title <- add_title("June") / rcp45_2075_Jun + plot_layout(heights = c(0.09, 1))
rcp45_2075_Jul_title <- add_title("July") / rcp45_2075_Jul + plot_layout(heights = c(0.09, 1))
rcp45_2075_Aug_title <- add_title("August") / rcp45_2075_Aug + plot_layout(heights = c(0.09, 1))
rcp45_2075_Sep_title <- add_title("September") / rcp45_2075_Sep + plot_layout(heights = c(0.09, 1))
rcp45_2075_Oct_title <- add_title("October") / rcp45_2075_Oct + plot_layout(heights = c(0.09, 1))
rcp45_2075_Nov_title <- add_title("November") / rcp45_2075_Nov + plot_layout(heights = c(0.09, 1))
rcp45_2075_Dec_title <- add_title("December") / rcp45_2075_Dec + plot_layout(heights = c(0.09, 1))

RCP45_2075_monthly <- (
  (rcp45_2075_Dec_title | rcp45_2075_Jan_title | rcp45_2075_Feb_title) /
    (rcp45_2075_Mar_title | rcp45_2075_Apr_title | rcp45_2075_May_title) /
    (rcp45_2075_Jun_title | rcp45_2075_Jul_title | rcp45_2075_Aug_title) /
    (rcp45_2075_Sep_title | rcp45_2075_Oct_title | rcp45_2075_Nov_title))

RCP45_2075_monthly

ggsave(filename = "RCP45_2075_monthly.png", plot = RCP45_2075_monthly, width = 8, height = 8, units = "in", dpi = 300)

#RCP85 2075
rcp85_2075_Jan <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Jan['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_Feb <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Feb['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_Mar <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Mar['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_Apr <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Apr['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_May <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_May['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_Jun <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Jun['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_Jul <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Jul['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_Aug <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Aug['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_Sep <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Sep['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_Oct <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Oct['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_Nov <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Nov['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

rcp85_2075_Dec <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(forecast_rcp85_2075_Dec['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

rcp85_2075_Jan_title <- add_title("January") / rcp85_2075_Jan + plot_layout(heights = c(0.09, 1))
rcp85_2075_Feb_title <- add_title("February") / rcp85_2075_Feb + plot_layout(heights = c(0.09, 1))
rcp85_2075_Mar_title <- add_title("March") / rcp85_2075_Mar + plot_layout(heights = c(0.09, 1))
rcp85_2075_Apr_title <- add_title("April") / rcp85_2075_Apr + plot_layout(heights = c(0.09, 1))
rcp85_2075_May_title <- add_title("May") / rcp85_2075_May + plot_layout(heights = c(0.09, 1))
rcp85_2075_Jun_title <- add_title("June") / rcp85_2075_Jun + plot_layout(heights = c(0.09, 1))
rcp85_2075_Jul_title <- add_title("July") / rcp85_2075_Jul + plot_layout(heights = c(0.09, 1))
rcp85_2075_Aug_title <- add_title("August") / rcp85_2075_Aug + plot_layout(heights = c(0.09, 1))
rcp85_2075_Sep_title <- add_title("September") / rcp85_2075_Sep + plot_layout(heights = c(0.09, 1))
rcp85_2075_Oct_title <- add_title("October") / rcp85_2075_Oct + plot_layout(heights = c(0.09, 1))
rcp85_2075_Nov_title <- add_title("November") / rcp85_2075_Nov + plot_layout(heights = c(0.09, 1))
rcp85_2075_Dec_title <- add_title("December") / rcp85_2075_Dec + plot_layout(heights = c(0.09, 1))

rcp85_2075_monthly <- (
  (rcp85_2075_Dec_title | rcp85_2075_Jan_title | rcp85_2075_Feb_title) /
    (rcp85_2075_Mar_title | rcp85_2075_Apr_title | rcp85_2075_May_title) /
    (rcp85_2075_Jun_title | rcp85_2075_Jul_title | rcp85_2075_Aug_title) /
    (rcp85_2075_Sep_title | rcp85_2075_Oct_title | rcp85_2075_Nov_title))

rcp85_2075_monthly

ggsave(filename = "rcp85_2075_monthly.png", plot = rcp85_2075_monthly, width = 8, height = 8, units = "in", dpi = 300)


#nowcasts monthly
nowcast_Jan <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_g_Jan['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_Feb <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_g_Feb['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_Mar <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_g_Mar['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_Apr <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Apr['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_May <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_May['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_Jun <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Jun['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_Jul <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Jul['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_Aug <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Aug['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_Sep <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Sep['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_Oct <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_c_Oct['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_Nov <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_g_Nov['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

nowcast_Dec <- as.ggplot(~{
  par(mar = c(4, 4, 4, 4), pty = "s")
  coast <- read_coastline()
  plot(nowcast_g_Dec['.pred_presence'],
       main = "",
       axes = FALSE, breaks = seq(0, 1, by = 0.1), reset = FALSE, key.pos = NULL)
  plot(coast, col = "orange", lwd = 2, add = TRUE)
})

add_title <- function(title_text){
  ggplot() +
    annotate("text", x = 0.5, y = 0.5, label = title_text, size = 4, hjust = 0.5) +
    theme_void() +
    theme(plot.margin = margin(-10, 0, -10, 0))
}

nowcast_Jan_title <- add_title("January") / nowcast_Jan + plot_layout(heights = c(0.09, 1))
nowcast_Feb_title <- add_title("February") / nowcast_Feb + plot_layout(heights = c(0.09, 1))
nowcast_Mar_title <- add_title("March") / nowcast_Mar + plot_layout(heights = c(0.09, 1))
nowcast_Apr_title <- add_title("April") / nowcast_Apr + plot_layout(heights = c(0.09, 1))
nowcast_May_title <- add_title("May") / nowcast_May + plot_layout(heights = c(0.09, 1))
nowcast_Jun_title <- add_title("June") / nowcast_Jun + plot_layout(heights = c(0.09, 1))
nowcast_Jul_title <- add_title("July") / nowcast_Jul + plot_layout(heights = c(0.09, 1))
nowcast_Aug_title <- add_title("August") / nowcast_Aug + plot_layout(heights = c(0.09, 1))
nowcast_Sep_title <- add_title("September") / nowcast_Sep + plot_layout(heights = c(0.09, 1))
nowcast_Oct_title <- add_title("October") / nowcast_Oct + plot_layout(heights = c(0.09, 1))
nowcast_Nov_title <- add_title("November") / nowcast_Nov + plot_layout(heights = c(0.09, 1))
nowcast_Dec_title <- add_title("December") / nowcast_Dec + plot_layout(heights = c(0.09, 1))

nowcast_monthly <- (
  (nowcast_Dec_title | nowcast_Jan_title | nowcast_Feb_title) /
    (nowcast_Mar_title | nowcast_Apr_title | nowcast_May_title) /
    (nowcast_Jun_title | nowcast_Jul_title | nowcast_Aug_title) /
    (nowcast_Sep_title | nowcast_Oct_title | nowcast_Nov_title))

nowcast_monthly

ggsave(filename = "nowcast_monthly.png", plot = nowcast_monthly, width = 8, height = 8, units = "in", dpi = 300)
