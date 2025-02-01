cfg_g_Jan$keep_vars
cfg_g_Feb$keep_vars
cfg_g_Mar$keep_vars
cfg_c_Apr$keep_vars
cfg_c_May$keep_vars
cfg_c_Jun$keep_vars
cfg_c_Jul$keep_vars
cfg_c_Aug$keep_vars
cfg_c_Sep$keep_vars
cfg_c_Oct$keep_vars
cfg_g_Nov$keep_vars
cfg_g_Dec$keep_vars

# Create a table of keep_vars for each dataset
library(tibble)
library(writexl)
keep_vars_table <- tibble(
  Month = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
  Keep_Vars = list(
    cfg_g_Jan$keep_vars, 
    cfg_g_Feb$keep_vars, 
    cfg_g_Mar$keep_vars, 
    cfg_c_Apr$keep_vars, 
    cfg_c_May$keep_vars, 
    cfg_c_Jun$keep_vars, 
    cfg_c_Jul$keep_vars, 
    cfg_c_Aug$keep_vars, 
    cfg_c_Sep$keep_vars, 
    cfg_c_Oct$keep_vars, 
    cfg_g_Nov$keep_vars, 
    cfg_g_Dec$keep_vars
  )
)

# View the table
print(keep_vars_table)
write_xlsx(keep_vars_table, path = "keep_vars_table.xlsx")
keep_vars_table[] <- lapply(keep_vars_table, as.character)
