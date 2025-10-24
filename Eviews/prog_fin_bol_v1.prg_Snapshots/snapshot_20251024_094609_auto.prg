'Programacion Financiera RAF

close @all

%path = @runpath
cd %path

'cd "C:\Users\CESAR\Documents\GitHub\Financial_Programming_BO\Eviews"

import data_finprog_bo.xlsx range=Hoja1 colhead=1 na="#N/A" @freq A @id @date(year) @smpl @all
