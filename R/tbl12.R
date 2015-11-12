source("R/clean-data.R")

# tabela 12

dt_tbl12_1 <- dt[OBS %in% 1, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), TIPO_MODELO), by = c("MODELO", "ESTADO")]
dt_tbl12_2 <- dt[OBS %in% 1:4, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), TIPO_MODELO), by = c("MODELO", "ESTADO")]
dt_tbl12_3 <- dt[OBS %in% 5:8, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), TIPO_MODELO), by = c("MODELO", "ESTADO")]
dt_tbl12_4 <- dt[OBS %in% 9:12, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), TIPO_MODELO), by = c("MODELO", "ESTADO")]
dt_tbl12_5 <- dt[OBS %in% 13:16, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), TIPO_MODELO), by = c("MODELO", "ESTADO")]
dt_tbl12_6 <- dt[OBS %in% 17:20, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), TIPO_MODELO), by = c("MODELO", "ESTADO")]
dt_tbl12_7 <- dt[OBS %in% 1:20, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), TIPO_MODELO), by = c("MODELO", "ESTADO")]


tbl12 <- cbind(
  dt_tbl12_1[, .("n=1" = mean(abs(ERRO_ACUMULADO))), by = TIPO_MODELO],
  dt_tbl12_2[, .("n=1:4" = mean(abs(ERRO_ACUMULADO))), by = TIPO_MODELO][, 2, with = FALSE],
  dt_tbl12_3[, .("n=5:8" = mean(abs(ERRO_ACUMULADO))), by = TIPO_MODELO][, 2, with = FALSE],
  dt_tbl12_4[, .("n=9:12" = mean(abs(ERRO_ACUMULADO))), by = TIPO_MODELO][, 2, with = FALSE],
  dt_tbl12_5[, .("n=13:16" = mean(abs(ERRO_ACUMULADO))), by = TIPO_MODELO][, 2, with = FALSE],
  dt_tbl12_6[, .("n=17:20" = mean(abs(ERRO_ACUMULADO))), by = TIPO_MODELO][, 2, with = FALSE],
  dt_tbl12_7[, .("n=1:20" = mean(abs(ERRO_ACUMULADO))), by = TIPO_MODELO][, 2, with = FALSE]
)


write.csv(tbl12, file = "tabelas/tbl12.csv", row.names = FALSE)
