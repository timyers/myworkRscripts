## data
# test with 3 snps
df_haplotype <- read.delim(file = "https://raw.githubusercontent.com/timyers/myworkRscripts/main/R/data/ldhap_haplotype3.txt")
df_variant <- read.delim(file = "https://raw.githubusercontent.com/timyers/myworkRscripts/main/R/data/ldhap_variant3.txt")
num_of_snps <- 3

# test with 8 snps
df_haplotype <- read.delim(file = "https://raw.githubusercontent.com/timyers/myworkRscripts/main/R/data/ldhap_haplotype8.txt")
df_variant <- read.delim(file = "https://raw.githubusercontent.com/timyers/myworkRscripts/main/R/data/ldhap_variant8.txt")
num_of_snps <- 8

# test with 1 snp
df_haplotype <- read.delim(file = "https://raw.githubusercontent.com/timyers/myworkRscripts/main/R/data/ldhap_haplotype1.txt")
df_variant <- read.delim(file = "https://raw.githubusercontent.com/timyers/myworkRscripts/main/R/data/ldhap_variant1.txt")
num_of_snps <- 1


# transpose dataframe
df_hap_transpose <- as.data.frame(t(as.matrix(df_haplotype)))

# df_all <- cbind(df_variant, df_hap_transpose)

# combine haplotypes from df_hap_transpose
df_all <- cbind(df_variant, df_hap_transpose[c(1:num_of_snps),c(1:ncol(df_hap_transpose))])

# remove extra rownames
rownames(df_all) <- c()

# change column names
names(df_all)[4] <- "Haplotypes"
# names(df_all)[5:ncol(df_all)] <- " "

# create new data frame with Count & Frequency
df3 <- df_hap_transpose[(num_of_snps+1):nrow(df_hap_transpose),]
# change row names to "Haplotype_Count" & "Haplotype Frequency"
###### Insert code here ######
# Convert row names into first column
df3 <- cbind(rownames(df3), data.frame(df3, row.names=NULL))


# create empty data frame
df4 <- data.frame(matrix("   ", nrow = 2, ncol = 2))
# combine df3 & df4
df5 <- cbind(df4, df3)

# row bind new data frame, df5, to df_all
df_total <- data.frame(mapply(c, df_all, df5))

# change column names
names(df_total)[5:ncol(df_total)] <- " "
