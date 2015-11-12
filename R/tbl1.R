source("R/clean-data.R")

# tabela 1

tbl1 <- cbind(
  dt[OBS %in% 1, .("n=1" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO],
  dt[OBS %in% 1:4, .("n=1:4" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE],
  dt[OBS %in% 5:8, .("n=5:8" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE],
  dt[OBS %in% 9:12, .("n=9:12" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE],
  dt[OBS %in% 13:16, .("n=13:16" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE],
  dt[OBS %in% 17:20, .("n=17:20" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE],
  dt[OBS %in% 1:20, .("n=1:20" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = MODELO][, 2, with = FALSE]
)

write.csv(tbl1, file = "tabelas/tbl1.csv", row.names = FALSE)
