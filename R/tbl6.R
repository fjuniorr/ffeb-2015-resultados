source("R/clean-data.R")

# tabela 6

dt_tbl6_1 <- dt[OBS %in% 1, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl6_2 <- dt[OBS %in% 1:4, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl6_3 <- dt[OBS %in% 5:8, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl6_4 <- dt[OBS %in% 9:12, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl6_5 <- dt[OBS %in% 13:16, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl6_6 <- dt[OBS %in% 17:20, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl6_7 <- dt[OBS %in% 1:20, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]


tbl6 <- cbind(
  dt_tbl6_1[, .("n=1" = mean(abs(ERRO_ACUMULADO))), by = ESTADO],
  dt_tbl6_2[, .("n=1:4" = mean(abs(ERRO_ACUMULADO))), by = ESTADO][, 2, with = FALSE],
  dt_tbl6_3[, .("n=5:8" = mean(abs(ERRO_ACUMULADO))), by = ESTADO][, 2, with = FALSE],
  dt_tbl6_4[, .("n=9:12" = mean(abs(ERRO_ACUMULADO))), by = ESTADO][, 2, with = FALSE],
  dt_tbl6_5[, .("n=13:16" = mean(abs(ERRO_ACUMULADO))), by = ESTADO][, 2, with = FALSE],
  dt_tbl6_6[, .("n=17:20" = mean(abs(ERRO_ACUMULADO))), by = ESTADO][, 2, with = FALSE],
  dt_tbl6_7[, .("n=1:20" = mean(abs(ERRO_ACUMULADO))), by = ESTADO][, 2, with = FALSE]
)


write.csv(tbl6, file = "tabelas/tbl6.csv", row.names = FALSE)
