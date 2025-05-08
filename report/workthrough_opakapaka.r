library(asar)
library(stockplotr)

## start template for opaka
asar::create_template(format = "pdf",office = "PIFSC",region = "U.S. West Coast",species = "Opakapaka",spp_latin = "Pristipomoides filamentosus",year = 2024,author = c("Megumi Oshima"))

## create standardized output and save as csv 
asar::convert_output(output_file = "Report.sso", outdir = getwd(), model = "ss3", save_name = "opaka_convert_output")

## read in standardized output
dat <- read.csv("opaka_convert_output.csv")
head(dat)

## create all figures
exp_all_figs_tables(dat, ref_line = "msy", ref_line_sb = "msy", indices_unit_label = "")

## checking figures
load("rda_files/biomass_figure.rda")
rda[[1]]

## create tables doc
create_tables_doc(subdir = file.path(getwd(), "report"), rda_dir = getwd())


## create figures doc
create_figures_doc(subdir = file.path(getwd(), "report"), rda_dir = getwd())


