source("R/clean-data.R")

dt_tbl7_1 <- dt[OBS %in% 1, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("ESTADO", "MODELO")]
foo_1 <- dt_tbl7_1[dt_tbl7_1[, .I[which.min(MAPE)], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_1 <- foo_1[, MODELO]
names(best_model_1) <- foo_1[, ESTADO]

tbl7_1 <- dt[OBS %in% 1 & MODELO == best_model_1[ESTADO], 
                  .("n=1" = mean(ERRO_PERCENTUAL_ABSOLUTO)), 
                  by = ESTADO]



dt_tbl7_2 <- dt[OBS %in% 1:4, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("ESTADO", "MODELO")]
foo_2 <- dt_tbl7_2[dt_tbl7_2[, .I[which.min(MAPE)], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_2 <- foo_2[, MODELO]
names(best_model_2) <- foo_2[, ESTADO]

tbl7_2 <- dt[OBS %in% 1:4 & MODELO == best_model_2[ESTADO], 
                  .("n=1:4" = mean(ERRO_PERCENTUAL_ABSOLUTO)), 
                  by = ESTADO]



dt_tbl7_3 <- dt[OBS %in% 5:8, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("ESTADO", "MODELO")]
foo_3 <- dt_tbl7_3[dt_tbl7_3[, .I[which.min(MAPE)], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_3 <- foo_3[, MODELO]
names(best_model_3) <- foo_3[, ESTADO]

tbl7_3 <- dt[OBS %in% 5:8 & MODELO == best_model_3[ESTADO], 
             .("n=5:8" = mean(ERRO_PERCENTUAL_ABSOLUTO)), 
             by = ESTADO]



dt_tbl7_4 <- dt[OBS %in% 9:12, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("ESTADO", "MODELO")]
foo_4 <- dt_tbl7_4[dt_tbl7_4[, .I[which.min(MAPE)], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_4 <- foo_4[, MODELO]
names(best_model_4) <- foo_4[, ESTADO]

tbl7_4 <- dt[OBS %in% 9:12 & MODELO == best_model_4[ESTADO], 
             .("n=9:12" = mean(ERRO_PERCENTUAL_ABSOLUTO)), 
             by = ESTADO]



dt_tbl7_5 <- dt[OBS %in% 13:16, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("ESTADO", "MODELO")]
foo_5 <- dt_tbl7_5[dt_tbl7_5[, .I[which.min(MAPE)], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_5 <- foo_5[, MODELO]
names(best_model_5) <- foo_5[, ESTADO]

tbl7_5 <- dt[OBS %in% 13:16 & MODELO == best_model_5[ESTADO], 
             .("n=13:16" = mean(ERRO_PERCENTUAL_ABSOLUTO)), 
             by = ESTADO]



dt_tbl7_6 <- dt[OBS %in% 17:20, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("ESTADO", "MODELO")]
foo_6 <- dt_tbl7_6[dt_tbl7_6[, .I[which.min(MAPE)], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_6 <- foo_6[, MODELO]
names(best_model_6) <- foo_6[, ESTADO]

tbl7_6 <- dt[OBS %in% 17:20 & MODELO == best_model_6[ESTADO], 
             .("n=17:20" = mean(ERRO_PERCENTUAL_ABSOLUTO)), 
             by = ESTADO]



dt_tbl7_7 <- dt[OBS %in% 1:20, .(MAPE = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = c("ESTADO", "MODELO")]
foo_7 <- dt_tbl7_7[dt_tbl7_7[, .I[which.min(MAPE)], by=ESTADO]$V1][, .(ESTADO, MODELO)]
best_model_7 <- foo_7[, MODELO]
names(best_model_7) <- foo_7[, ESTADO]

tbl7_7 <- dt[OBS %in% 1:20 & MODELO == best_model_7[ESTADO], 
             .("n=1:20" = mean(ERRO_PERCENTUAL_ABSOLUTO)), 
             by = ESTADO]

best_model7 <- data.frame(cbind(best_model_1, best_model_2, best_model_3, best_model_4, best_model_5, best_model_6, best_model_7))

l <- list(tbl7_1, tbl7_2, tbl7_3, tbl7_4, tbl7_5, tbl7_6, tbl7_7)

tbl7 <- Reduce(function(x,y){merge(x, y, by = "ESTADO", all = TRUE)}, l)

write.csv(tbl7, file = "tabelas/tbl7.csv", row.names = FALSE)
