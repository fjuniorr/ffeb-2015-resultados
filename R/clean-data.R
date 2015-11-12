library(ggplot2); library(data.table); library(readxl)

# EXECUCAO OBRIGATORIA
# leitura e preparacao dos dados

dt <- data.table(read_excel("./forecast_v2.xlsx", sheet = "Resultados"))
setnames(dt, c("MODELO", "FREQ", "OBS", "ESTADO", "PREVISTO", "REALIZADO", "SE", "REGIAO", "RCL_DOMINANTE", "PIB", "PRAZO", "LINEARIDADE", "TIPO"))

part_icms <- data.table(read_excel("./part_icms.xlsx", sheet = "data"))

dt <- merge(dt, part_icms, by = "ESTADO")
dt[, PART_ICMS_CAT := cut(PART_ICMS, breaks = 5, ordered_result = TRUE)]

tipo_modelo <- c(rep("benchmarking", 2), rep("univariado", 3), rep("multivariado", 2), rep("combinacao", 2))
names(tipo_modelo) <- unique(dt$MODELO)

dt[, TIPO_MODELO := tipo_modelo[MODELO]]

# exclusao de outliers

dt[ESTADO == "RR" & OBS == 3, REALIZADO := 31181553 + 119526428]
dt[ESTADO == "RR" & OBS == 4, REALIZADO := 323744259 - 119526428]

# calculo medidas acuracia

dt[, ERRO := REALIZADO - PREVISTO]
dt[, ERRO_PERCENTUAL := ERRO / REALIZADO]
dt[, ERRO_PERCENTUAL_ABSOLUTO  := abs(ERRO_PERCENTUAL)]
