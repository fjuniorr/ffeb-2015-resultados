source("R/clean-data.R")

dt_tbl3_1 <- dt[OBS %in% 1, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("MODELO", "ESTADO")]
dt_tbl3_1 <- dt_tbl3_1[dt_tbl3_1[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl3_1[, "n=1" := (N / sum(N))]
dt_tbl3_1[, N := NULL]


dt_tbl3_2 <- dt[OBS %in% 1:4, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("MODELO", "ESTADO")]
dt_tbl3_2 <- dt_tbl3_2[dt_tbl3_2[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl3_2[, "n=1:4" := (N / sum(N))]
dt_tbl3_2[, N := NULL]


dt_tbl3_3 <- dt[OBS %in% 5:8, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("MODELO", "ESTADO")]
dt_tbl3_3 <- dt_tbl3_3[dt_tbl3_3[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl3_3[, "n=5:8" := (N / sum(N))]
dt_tbl3_3[, N := NULL]


dt_tbl3_4 <- dt[OBS %in% 9:12, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("MODELO", "ESTADO")]
dt_tbl3_4 <- dt_tbl3_4[dt_tbl3_4[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl3_4[, "n=9:12" := (N / sum(N))]
dt_tbl3_4[, N := NULL]

dt_tbl3_5 <- dt[OBS %in% 13:16, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("MODELO", "ESTADO")]
dt_tbl3_5 <- dt_tbl3_5[dt_tbl3_5[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl3_5[, "n=13:16" := (N / sum(N))]
dt_tbl3_5[, N := NULL]

dt_tbl3_6 <- dt[OBS %in% 17:20, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("MODELO", "ESTADO")]
dt_tbl3_6 <- dt_tbl3_6[dt_tbl3_6[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl3_6[, "n=17:20" := (N / sum(N))]
dt_tbl3_6[, N := NULL]

dt_tbl3_7 <- dt[OBS %in% 1:20, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("MODELO", "ESTADO")]
dt_tbl3_7 <- dt_tbl3_7[dt_tbl3_7[, .I[which.min(MAPE)], by=ESTADO]$V1][, .N, by = MODELO]
dt_tbl3_7[, "n=1:20" := (N / sum(N))]
dt_tbl3_7[, N := NULL]


l <- list(dt_tbl3_1, dt_tbl3_2, dt_tbl3_3, dt_tbl3_4, dt_tbl3_5, dt_tbl3_6, dt_tbl3_7)

tbl3 <- Reduce(function(x,y){merge(x, y, by = "MODELO", all = TRUE)}, l)

write.csv(tbl3, file = "tabelas/tbl3.csv", row.names = FALSE)