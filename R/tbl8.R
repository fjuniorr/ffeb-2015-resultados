source("R/clean-data.R")

dt_tbl8_1 <- dt[OBS %in% 1, .(ERRO_ACUMULADO = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), by = c("ESTADO", "MODELO")]
foo_1 <- dt_tbl8_1[dt_tbl8_1[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_1 <- foo_1[, MODELO]
names(best_model_1) <- foo_1[, ESTADO]

tbl8_1 <- dt[OBS %in% 1 & MODELO == best_model_1[ESTADO], 
                  .("n=1" = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), 
                  by = ESTADO]



dt_tbl8_2 <- dt[OBS %in% 1:4, .(ERRO_ACUMULADO = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), by = c("ESTADO", "MODELO")]
foo_2 <- dt_tbl8_2[dt_tbl8_2[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_2 <- foo_2[, MODELO]
names(best_model_2) <- foo_2[, ESTADO]

tbl8_2 <- dt[OBS %in% 1:4 & MODELO == best_model_2[ESTADO], 
                  .("n=1:4" = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), 
                  by = ESTADO]



dt_tbl8_3 <- dt[OBS %in% 5:8, .(ERRO_ACUMULADO = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), by = c("ESTADO", "MODELO")]
foo_3 <- dt_tbl8_3[dt_tbl8_3[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_3 <- foo_3[, MODELO]
names(best_model_3) <- foo_3[, ESTADO]

tbl8_3 <- dt[OBS %in% 5:8 & MODELO == best_model_3[ESTADO], 
             .("n=5:8" = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), 
             by = ESTADO]



dt_tbl8_4 <- dt[OBS %in% 9:12, .(ERRO_ACUMULADO = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), by = c("ESTADO", "MODELO")]
foo_4 <- dt_tbl8_4[dt_tbl8_4[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_4 <- foo_4[, MODELO]
names(best_model_4) <- foo_4[, ESTADO]

tbl8_4 <- dt[OBS %in% 9:12 & MODELO == best_model_4[ESTADO], 
             .("n=9:12" = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), 
             by = ESTADO]



dt_tbl8_5 <- dt[OBS %in% 13:16, .(ERRO_ACUMULADO = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), by = c("ESTADO", "MODELO")]
foo_5 <- dt_tbl8_5[dt_tbl8_5[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_5 <- foo_5[, MODELO]
names(best_model_5) <- foo_5[, ESTADO]

tbl8_5 <- dt[OBS %in% 13:16 & MODELO == best_model_5[ESTADO], 
             .("n=13:16" = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), 
             by = ESTADO]



dt_tbl8_6 <- dt[OBS %in% 17:20, .(ERRO_ACUMULADO = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), by = c("ESTADO", "MODELO")]
foo_6 <- dt_tbl8_6[dt_tbl8_6[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_6 <- foo_6[, MODELO]
names(best_model_6) <- foo_6[, ESTADO]

tbl8_6 <- dt[OBS %in% 17:20 & MODELO == best_model_6[ESTADO], 
             .("n=17:20" = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), 
             by = ESTADO]



dt_tbl8_7 <- dt[OBS %in% 1:20, .(ERRO_ACUMULADO = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), by = c("ESTADO", "MODELO")]
foo_7 <- dt_tbl8_7[dt_tbl8_7[, .I[which.min(abs(ERRO_ACUMULADO))], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_7 <- foo_7[, MODELO]
names(best_model_7) <- foo_7[, ESTADO]

tbl8_7 <- dt[OBS %in% 1:20 & MODELO == best_model_7[ESTADO], 
             .("n=1:20" = (sum(REALIZADO) - sum(PREVISTO)) / sum(REALIZADO)), 
             by = ESTADO]

best_model8 <- data.frame(cbind(best_model_1, best_model_2, best_model_3, best_model_4, best_model_5, best_model_6, best_model_7))

l <- list(tbl8_1, tbl8_2, tbl8_3, tbl8_4, tbl8_5, tbl8_6, tbl8_7)

tbl8 <- Reduce(function(x,y){merge(x, y, by = "ESTADO", all = TRUE)}, l)

write.csv(tbl8, file = "tabelas/tbl8.csv", row.names = FALSE)
