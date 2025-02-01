c_JanAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_JanAUC.csv")
c_FebAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_FebAUC.csv")
c_MarAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_MarAUC.csv")
c_AprAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_AprAUC.csv")
c_MayAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_MayAUC.csv")
c_JunAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_JunAUC.csv")
c_JulAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_JulAUC.csv")
c_AugAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_AugAUC.csv")
c_SepAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_SepAUC.csv")
c_OctAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_OctAUC.csv")
c_NovAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_NovAUC.csv")
c_DecAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/c_DecAUC.csv")
g_JanAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_JanAUC.csv")
g_FebAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_FebAUC.csv")
g_MarAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_MarAUC.csv")
g_AprAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_AprAUC.csv")
g_MayAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_MayAUC.csv")
g_JunAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_JunAUC.csv")
g_JulAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_JulAUC.csv")
g_AugAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_AugAUC.csv")
g_SepAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_SepAUC.csv")
g_OctAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_OctAUC.csv")
g_NovAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_NovAUC.csv")
g_DecAUC = read_csv("/Users/bloom/Desktop/data/2025/bloom/models/g_DecAUC.csv")


# List of data frame names ending with "AUC"
AUC_dfs <- mget(ls(pattern = "AUC$"))

# Specify the column name you're interested in
AUC_estimate <- ".estimate" 

# Create the result data frame
AUC_comparison_table <- data.frame(
  file_name = names(AUC_dfs),
  column_value = sapply(AUC_dfs, function(df) df[[AUC_estimate]][1]))

write_csv(AUC_comparison_table, "AUC_Comparisons.csv")
