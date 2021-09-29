df_haplotype <- read.delim(file = "ldhap_haplotype.txt")
df_variant <- read.delim(file = "ldhap_variant.txt")


# transpose dataframe
df_hap_transpose <- as.data.frame(t(as.matrix(df_haplotype)))

# df_all <- cbind(df_variant, df_hap_transpose)

# combine haplotypes from df_hap_transpose
df_all <- cbind(df_variant, df_hap_transpose[c(1:3),c(1:4)])

# remove rownames
rownames(df_all) <- c()

# change column names
names(df_all)[4:ncol(df_all)] <- "Haplotype"
names(df_all)[5:ncol(df_all)] <- "      "
