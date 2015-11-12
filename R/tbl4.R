source("R/clean-data.R")

dt_tbl4_1 <- dt[OBS %in% 1, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl4_1 <- dt_tbl4_1[dt_tbl4_1[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl4_1[, "n=1" := (N / sum(N))]
dt_tbl4_1[, N := NULL]


dt_tbl4_2 <- dt[OBS %in% 1:4, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl4_2 <- dt_tbl4_2[dt_tbl4_2[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl4_2[, "n=1:4" := (N / sum(N))]
dt_tbl4_2[, N := NULL]


dt_tbl4_3 <- dt[OBS %in% 5:8, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl4_3 <- dt_tbl4_3[dt_tbl4_3[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl4_3[, "n=5:8" := (N / sum(N))]
dt_tbl4_3[, N := NULL]


dt_tbl4_4 <- dt[OBS %in% 9:12, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl4_4 <- dt_tbl4_4[dt_tbl4_4[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl4_4[, "n=9:12" := (N / sum(N))]
dt_tbl4_4[, N := NULL]

dt_tbl4_5 <- dt[OBS %in% 13:16, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl4_5 <- dt_tbl4_5[dt_tbl4_5[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl4_5[, "n=13:16" := (N / sum(N))]
dt_tbl4_5[, N := NULL]

dt_tbl4_6 <- dt[OBS %in% 17:20, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl4_6 <- dt_tbl4_6[dt_tbl4_6[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl4_6[, "n=17:20" := (N / sum(N))]
dt_tbl4_6[, N := NULL]

dt_tbl4_7 <- dt[OBS %in% 1:20, .(ERRO_ACUMULADO = ((sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO))), by = c("MODELO", "ESTADO")]
dt_tbl4_7 <- dt_tbl4_7[dt_tbl4_7[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl4_7[, "n=1:20" := (N / sum(N))]
dt_tbl4_7[, N := NULL]


l <- list(dt_tbl4_1, dt_tbl4_2, dt_tbl4_3, dt_tbl4_4, dt_tbl4_5, dt_tbl4_6, dt_tbl4_7)

tbl4 <- Reduce(function(x,y){merge(x, y, by = "MODELO", all = TRUE)}, l)

write.csv(tbl4, file = "tabelas/tbl4.csv", row.names = FALSE)