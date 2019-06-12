delete_file <- function(fn){  
  #Check its existence
  if (file.exists(fn)) 
  {#Delete file if it exists
  print('file exists! -- deleting now.')
  file.remove(fn)}
}