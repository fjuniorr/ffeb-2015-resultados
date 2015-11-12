source("R/clean-data.R")

# tabela 14

dt_tbl14_1 <- dt[OBS %in% 1, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), PART_ICMS_CAT), by = c("MODELO", "ESTADO")]
dt_tbl14_2 <- dt[OBS %in% 1:4, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), PART_ICMS_CAT), by = c("MODELO", "ESTADO")]
dt_tbl14_3 <- dt[OBS %in% 5:8, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), PART_ICMS_CAT), by = c("MODELO", "ESTADO")]
dt_tbl14_4 <- dt[OBS %in% 9:12, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), PART_ICMS_CAT), by = c("MODELO", "ESTADO")]
dt_tbl14_5 <- dt[OBS %in% 13:16, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), PART_ICMS_CAT), by = c("MODELO", "ESTADO")]
dt_tbl14_6 <- dt[OBS %in% 17:20, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), PART_ICMS_CAT), by = c("MODELO", "ESTADO")]
dt_tbl14_7 <- dt[OBS %in% 1:20, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), PART_ICMS_CAT), by = c("MODELO", "ESTADO")]


tbl14 <- cbind(
  dt_tbl14_1[, .("n=1" = mean(abs(ERRO_ACUMULADO))), by = PART_ICMS_CAT],
  dt_tbl14_2[, .("n=1:4" = mean(abs(ERRO_ACUMULADO))), by = PART_ICMS_CAT][, 2, with = FALSE],
  dt_tbl14_3[, .("n=5:8" = mean(abs(ERRO_ACUMULADO))), by = PART_ICMS_CAT][, 2, with = FALSE],
  dt_tbl14_4[, .("n=9:12" = mean(abs(ERRO_ACUMULADO))), by = PART_ICMS_CAT][, 2, with = FALSE],
  dt_tbl14_5[, .("n=13:16" = mean(abs(ERRO_ACUMULADO))), by = PART_ICMS_CAT][, 2, with = FALSE],
  dt_tbl14_6[, .("n=17:20" = mean(abs(ERRO_ACUMULADO))), by = PART_ICMS_CAT][, 2, with = FALSE],
  dt_tbl14_7[, .("n=1:20" = mean(abs(ERRO_ACUMULADO))), by = PART_ICMS_CAT][, 2, with = FALSE]
)


write.csv(tbl14, file = "tabelas/tbl14.csv", row.names = FALSE)
