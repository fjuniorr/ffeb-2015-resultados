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


# tabela 1

cbind(
dt[OBS %in% 1, .("n=1" = round(mean(ERRO_PERCENTUAL_ABSOLUTO)*100, 1)), by = MODELO]
,
dt[OBS %in% 1:4, .("n=1:4" = round(mean(ERRO_PERCENTUAL_ABSOLUTO)*100, 1)), by = MODELO][, 2, with = FALSE]
,
dt[OBS %in% 1:8, .("n=1:8" = round(mean(ERRO_PERCENTUAL_ABSOLUTO)*100, 1)), by = MODELO][, 2, with = FALSE]
,
dt[OBS %in% 1:12, .("n=1:12" = round(mean(ERRO_PERCENTUAL_ABSOLUTO)*100, 1)), by = MODELO][, 2, with = FALSE]
,
dt[OBS %in% 1:16, .("n=1:16" = round(mean(ERRO_PERCENTUAL_ABSOLUTO)*100, 1)), by = MODELO][, 2, with = FALSE]
,
dt[OBS %in% 1:20, .("n=1:20" = round(mean(ERRO_PERCENTUAL_ABSOLUTO)*100, 1)), by = MODELO][, 2, with = FALSE]
)

# grafico 1

dt_graf1 <- dt[, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("OBS", "MODELO")]

ggplot(dt_graf1, aes(x = OBS, y = MAPE, color = MODELO)) + geom_line()
ggplot(dt_graf1, aes(x = factor(OBS), y = MAPE)) + geom_boxplot()


# grafico 2

dt_graf2 <- dt[, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)*100), by = c("ESTADO")]
ggplot(dt_graf2, aes(x = reorder(ESTADO, MAPE, ), y = MAPE)) + geom_bar(stat = "identity") + geom_text(aes(label=round(MAPE, 1)), vjust=1.5, colour="white")



