source("R/clean-data.R")

# tabela 10

dt_tbl10_1 <- dt[OBS %in% 1, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), REGIAO), by = c("MODELO", "ESTADO")]
dt_tbl10_2 <- dt[OBS %in% 1:4, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), REGIAO), by = c("MODELO", "ESTADO")]
dt_tbl10_3 <- dt[OBS %in% 5:8, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), REGIAO), by = c("MODELO", "ESTADO")]
dt_tbl10_4 <- dt[OBS %in% 9:12, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), REGIAO), by = c("MODELO", "ESTADO")]
dt_tbl10_5 <- dt[OBS %in% 13:16, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), REGIAO), by = c("MODELO", "ESTADO")]
dt_tbl10_6 <- dt[OBS %in% 17:20, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), REGIAO), by = c("MODELO", "ESTADO")]
dt_tbl10_7 <- dt[OBS %in% 1:20, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), REGIAO), by = c("MODELO", "ESTADO")]


tbl10 <- cbind(
  dt_tbl10_1[, .("n=1" = mean(abs(ERRO_ACUMULADO))), by = REGIAO],
  dt_tbl10_2[, .("n=1:4" = mean(abs(ERRO_ACUMULADO))), by = REGIAO][, 2, with = FALSE],
  dt_tbl10_3[, .("n=5:8" = mean(abs(ERRO_ACUMULADO))), by = REGIAO][, 2, with = FALSE],
  dt_tbl10_4[, .("n=9:12" = mean(abs(ERRO_ACUMULADO))), by = REGIAO][, 2, with = FALSE],
  dt_tbl10_5[, .("n=13:16" = mean(abs(ERRO_ACUMULADO))), by = REGIAO][, 2, with = FALSE],
  dt_tbl10_6[, .("n=17:20" = mean(abs(ERRO_ACUMULADO))), by = REGIAO][, 2, with = FALSE],
  dt_tbl10_7[, .("n=1:20" = mean(abs(ERRO_ACUMULADO))), by = REGIAO][, 2, with = FALSE]
)


write.csv(tbl10, file = "tabelas/tbl10.csv", row.names = FALSE)
