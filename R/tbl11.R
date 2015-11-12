source("R/clean-data.R")

# tabela 11

tbl11 <- cbind(
  dt[OBS %in% 1, .("n=1" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = TIPO_MODELO],
  dt[OBS %in% 1:4, .("n=1:4" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = TIPO_MODELO][, 2, with = FALSE],
  dt[OBS %in% 5:8, .("n=5:8" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = TIPO_MODELO][, 2, with = FALSE],
  dt[OBS %in% 9:12, .("n=9:12" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = TIPO_MODELO][, 2, with = FALSE],
  dt[OBS %in% 13:16, .("n=13:16" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = TIPO_MODELO][, 2, with = FALSE],
  dt[OBS %in% 17:20, .("n=17:20" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = TIPO_MODELO][, 2, with = FALSE],
  dt[OBS %in% 1:20, .("n=1:20" = mean(ERRO_PERCENTUAL_ABSOLUTO)), by = TIPO_MODELO][, 2, with = FALSE]
)

write.csv(tbl11, file = "tabelas/tbl11.csv", row.names = FALSE)
