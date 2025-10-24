'Programacion Financiera RAF

close @all

%path = @runpath
cd %path

'cd "C:\Users\CESAR\Documents\GitHub\Financial_Programming_BO\Eviews"

import data_finprog_bo.xlsx range=Hoja1 colhead=1 na="#N/A" @freq A @id @date(year) @smpl @all

' Generate Binary Variables 
'group gDums @expand(year)
' o con bucle:
for !yy = 1988 to 2024
  series d!yy = (year = !yy)
next

' Estimate all equations

