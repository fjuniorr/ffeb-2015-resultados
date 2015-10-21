library(ggplot2); library(data.table); library(readxl)

# leitura e preparacao dos dados

dt <- data.table(read_excel("./data.xlsx", sheet = "Resultados"))
setnames(dt, c("MODELO", "FREQ", "OBS", "ESTADO", "PREVISTO", "REALIZADO", "SE", "REGIAO", "RCL", "PIB", "PRAZO", "LINEARIDADE", "TIPO"))

# calculo medidas acuracia

dt[, ERRO := REALIZADO - PREVISTO]
dt[, ERRO_PERCENTUAL := ERRO / REALIZADO]
dt[, ERRO_PERCENTUAL_ABSOLUTO  := abs(ERRO_PERCENTUAL)]

# exclusao de outliers

dt <- dt[!(ESTADO == "RR" & OBS == 3), ]

# =============================================================
# tabela 1

tbl1 <- cbind(
dt[OBS %in% 1, .("n=1" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO],
dt[OBS %in% 1:4, .("n=1:4" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE],
dt[OBS %in% 1:8, .("n=1:8" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE],
dt[OBS %in% 1:12, .("n=1:12" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE],
dt[OBS %in% 1:16, .("n=1:16" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE],
dt[OBS %in% 1:20, .("n=1:20" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE]
)

# =============================================================
# tabela 2

dt_tbl2_1 <- dt[OBS %in% 1, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("MODELO", "ESTADO")]
dt_tbl2_1 <- dt_tbl2_1[dt_tbl2_1[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl2_1[, PROP_1 := (N / sum(N))]
dt_tbl2_1[, N := NULL]


dt_tbl2_2 <- dt[OBS %in% 1:4, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("MODELO", "ESTADO")]
dt_tbl2_2 <- dt_tbl2_2[dt_tbl2_2[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl2_2[, PROP_2 := (N / sum(N))]
dt_tbl2_2[, N := NULL]


dt_tbl2_3 <- dt[OBS %in% 1:8, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("MODELO", "ESTADO")]
dt_tbl2_3 <- dt_tbl2_3[dt_tbl2_3[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl2_3[, PROP_3 := (N / sum(N))]
dt_tbl2_3[, N := NULL]


dt_tbl2_4 <- dt[OBS %in% 1:12, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("MODELO", "ESTADO")]
dt_tbl2_4 <- dt_tbl2_4[dt_tbl2_4[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl2_4[, PROP_4 := (N / sum(N))]
dt_tbl2_4[, N := NULL]

dt_tbl2_5 <- dt[OBS %in% 1:16, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("MODELO", "ESTADO")]
dt_tbl2_5 <- dt_tbl2_5[dt_tbl2_5[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl2_5[, PROP_5 := (N / sum(N))]
dt_tbl2_5[, N := NULL]

dt_tbl2_6 <- dt[OBS %in% 1:20, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("MODELO", "ESTADO")]
dt_tbl2_6 <- dt_tbl2_6[dt_tbl2_6[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl2_6[, PROP_6 := (N / sum(N))]
dt_tbl2_6[, N := NULL]


l <- list(dt_tbl2_1, dt_tbl2_2, dt_tbl2_3, dt_tbl2_4, dt_tbl2_5, dt_tbl2_6)

tbl2 <- Reduce(function(x,y){merge(x, y, by = "MODELO", all = TRUE)}, l)

# =============================================================
# tabela 3

dt_tbl3 <- dt[, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("ESTADO", "MODELO")]

foo <- dt_tbl3[dt_tbl3[, .I[which.min(MAPE)], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model <- foo[, MODELO]
names(best_model) <- foo[, ESTADO]

dt_tbl3_1 <- dt[OBS %in% 1:12 & MODELO == best_model[ESTADO], 
              .(REALIZADO_1 = sum(REALIZADO), 
                PREVISTO_1 = sum(PREVISTO)), 
              by = ESTADO]

dt_tbl3_2 <- dt[OBS %in% 5:16 & MODELO == best_model[ESTADO], 
                .(REALIZADO_2 = sum(REALIZADO), 
                  PREVISTO_2 = sum(PREVISTO)), 
                by = ESTADO]

dt_tbl3_3 <- dt[OBS %in% 9:20 & MODELO == best_model[ESTADO], 
                .(REALIZADO_3 = sum(REALIZADO), 
                  PREVISTO_3 = sum(PREVISTO)), 
                by = ESTADO]

l <- list(dt_tbl3_1, dt_tbl3_2, dt_tbl3_3)

tbl3 <- Reduce(function(x,y){merge(x, y, by = "ESTADO", all = TRUE)}, l)

# =============================================================
# grafico 1

dt_graf1 <- dt[, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("OBS", "MODELO")]

graf1 <- ggplot(dt_graf1, aes(x = OBS, y = MAPE, color = MODELO)) + 
  geom_line() +
  theme_bw()

ggplot(dt_graf1, aes(x = factor(OBS), y = MAPE)) + geom_boxplot() + theme_bw()

# =============================================================
# grafico 2

dt_graf2 <- dt[, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("ESTADO")]

ggplot(dt_graf2, aes(x = reorder(ESTADO, MAPE), y = MAPE)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label=round(MAPE, 1)), vjust=1.5, colour="white", size = 3.5) +
  theme_bw()


ggplot(dt_graf2, aes(x=MAPE, y=reorder(ESTADO, MAPE))) +
  geom_segment(aes(yend=ESTADO), xend=0, colour="grey50") +
  geom_point(size=3) +
  scale_colour_brewer(palette="Set1", limits=c("NL","AL"), guide=FALSE) +
  theme_bw() +
  theme(panel.grid.major.y = element_blank()) +
  geom_text(aes(label=round(MAPE, 1)), hjust = -0.3 , vjust=0.3, colour="black", size = 4)



