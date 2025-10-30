'Programacion Financiera RAF

close @all

%path = @runpath
cd %path

'cd "C:\Users\CESAR\Documents\GitHub\Financial_Programming_BO\Eviews"

'import data_finprog_bo.xlsx range=Hoja1 colhead=1 na="#N/A" @freq A @id @date(year) @smpl @all
import data_finprog_bo.xlsx range=Hoja2 colhead=1 na="#N/A" @freq A @id @date(year) @smpl @all



' === Dummies d88 ... d24 (1988–2024)
for !yy = 1988 to 2024
  %v = "d" + @right(@str(!yy),2)   ' nombre: d88, d99, d00, ...a
  series {%v} = (@year = !yy)
next


' Estimate all equations

' 1 Equation - eq_cprivr
equation eq_cprivr.ls dlog(cprivr) c @lag(dlog(cprivr),1) dlog(pibr) ipasr d92 d97 d99 d19 d20 d21
' 2 Equation - eq_defcpub 
equation eq_defcpub.ls dlog(def_cpub) c dlog(ipc) inc_sal d98 d03 d16
' 3 Equation - eq_defcpriv
equation eq_defcpriv.ls dlog(defcpriv) c dlog(ipc) d91 d96 d06 d10 d11 d16 d24
' 4 Equation - defipriv
equation eq_defipriv.ls dlog(defipriv) c dlog(ipc) dlog(def_impor) d00 d03 d04 d05
' 5 Equation - defipub
equation eq_defipub.ls dlog(def_ipub) c dlog(ipc) dlog(def_impor) d00 d02 d06 d08 d24
' 6 Equation - emi
equation eq_emi.ls dlog(emi) c @lag(dlog(emi),1) inf_gap(-1) pib_gap(-1) d94 d05 d07 d20 d21 d23 d24
' 7 Equation - ib
equation eq_ib.ls d(ib) c dlog(emi) dlog(pibr) dlog(ipc) d00 d09 d19 d20 d23 d02 d14 d15 d17
' 8 Equation - iprivr
equation eq_iprivr.ls dlog(iprivr) c @lag(dlog(iprivr),1) dlog(pibr) iactr d90 d91 d93 d95 d97 d98 d99 d02
' 9 Equation - itcr
equation eq_itcr.ls dlog(itcr) c dlog(tc) dlog(dxy) inf_mundo dlog(ipc) d02 d05 d10 d22
' 10 Equation - m3
equation eq_m3.ls dlog(m3) c @lag(dlog(m3),1) dlog(ipc) dlog(pibr) ib d08 d09 d16 d20
' 11 Equation - phillips
equation eq_phillips.ls dlog(ipc) c @lag(dlog(ipc),1) pib_gap dlog(itcr) d92 d95 d02 d07 d08 d09 d10 d13 d20 d21 d24

'Anadir descripcion de ecuaciones y ver la menar de exportar desde eviews a excel  y anadir la tasa de crecimiento nueva

''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''Exportar''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'================= PATHS =================
%base   = @runpath
cd {%base}
%tables = %base + "\tables"   ' <- Debe existir

'================= CPRIVR =================
freeze(sp_eq_cprivr) eq_cprivr.output
%file_cprivr_csv = %tables + "\sp_eq_cprivr.csv"
sp_eq_cprivr.save(t=csv) {%file_cprivr_csv}

'================= DEFCPUB =================
freeze(sp_eq_defcpub) eq_defcpub.output
%file_defcpub_csv = %tables + "\sp_eq_defcpub.csv"
sp_eq_defcpub.save(t=csv) {%file_defcpub_csv}

'================= DEFCPRIV ================
freeze(sp_eq_defcpriv) eq_defcpriv.output
%file_defcpriv_csv = %tables + "\sp_eq_defcpriv.csv"
sp_eq_defcpriv.save(t=csv) {%file_defcpriv_csv}

'================= DEFIPRIV ================
freeze(sp_eq_defipriv) eq_defipriv.output
%file_defipriv_csv = %tables + "\sp_eq_defipriv.csv"
sp_eq_defipriv.save(t=csv) {%file_defipriv_csv}

'================= DEFIPUB =================
freeze(sp_eq_defipub) eq_defipub.output
%file_defipub_csv = %tables + "\sp_eq_defipub.csv"
sp_eq_defipub.save(t=csv) {%file_defipub_csv}

'================= EMI =====================
freeze(sp_eq_emi) eq_emi.output
%file_emi_csv = %tables + "\sp_eq_emi.csv"
sp_eq_emi.save(t=csv) {%file_emi_csv}

'================= IB ======================
freeze(sp_eq_ib) eq_ib.output
%file_ib_csv = %tables + "\sp_eq_ib.csv"
sp_eq_ib.save(t=csv) {%file_ib_csv}

'================= IPRIVR ==================
freeze(sp_eq_iprivr) eq_iprivr.output
%file_iprivr_csv = %tables + "\sp_eq_iprivr.csv"
sp_eq_iprivr.save(t=csv) {%file_iprivr_csv}

'================= ITCR ====================
freeze(sp_eq_itcr) eq_itcr.output
%file_itcr_csv = %tables + "\sp_eq_itcr.csv"
sp_eq_itcr.save(t=csv) {%file_itcr_csv}

'================= M3 ======================
freeze(sp_eq_m3) eq_m3.output
%file_m3_csv = %tables + "\sp_eq_m3.csv"
sp_eq_m3.save(t=csv) {%file_m3_csv}

'================= PHILLIPS ================
freeze(sp_eq_phillips) eq_phillips.output
%file_phillips_csv = %tables + "\sp_eq_phillips.csv"
sp_eq_phillips.save(t=csv) {%file_phillips_csv}


stop
'================= PATHS =================
%base   = @runpath
cd {%base}
%tables = %base + "\tables"   ' Debe existir

'================= CPRIVR =================
freeze(sp_eq_cprivr) eq_cprivr.output
%file_cprivr = %tables + "\sp_eq_cprivr.html"
sp_eq_cprivr.save(t=html) {%file_cprivr}
' (si prefieres CSV plano)
' %file_cprivr_csv = %tables + "\sp_eq_cprivr.csv"
' sp_eq_cprivr.save(t=csv) {%file_cprivr_csv}

'================= DEFCPUB =================
freeze(sp_eq_defcpub) eq_defcpub.output
%file_defcpub = %tables + "\sp_eq_defcpub.html"
sp_eq_defcpub.save(t=html) {%file_defcpub}
' %file_defcpub_csv = %tables + "\sp_eq_defcpub.csv"
' sp_eq_defcpub.save(t=csv) {%file_defcpub_csv}

'================= DEFCPRIV ================
freeze(sp_eq_defcpriv) eq_defcpriv.output
%file_defcpriv = %tables + "\sp_eq_defcpriv.html"
sp_eq_defcpriv.save(t=html) {%file_defcpriv}
' %file_defcpriv_csv = %tables + "\sp_eq_defcpriv.csv"
' sp_eq_defcpriv.save(t=csv) {%file_defcpriv_csv}

'================= DEFIPRIV ================
freeze(sp_eq_defipriv) eq_defipriv.output
%file_defipriv = %tables + "\sp_eq_defipriv.html"
sp_eq_defipriv.save(t=html) {%file_defipriv}
' %file_defipriv_csv = %tables + "\sp_eq_defipriv.csv"
' sp_eq_defipriv.save(t=csv) {%file_defipriv_csv}

'================= DEFIPUB =================
freeze(sp_eq_defipub) eq_defipub.output
%file_defipub = %tables + "\sp_eq_defipub.html"
sp_eq_defipub.save(t=html) {%file_defipub}
' %file_defipub_csv = %tables + "\sp_eq_defipub.csv"
' sp_eq_defipub.save(t=csv) {%file_defipub_csv}

'================= EMI =====================
freeze(sp_eq_emi) eq_emi.output
%file_emi = %tables + "\sp_eq_emi.html"
sp_eq_emi.save(t=html) {%file_emi}
' %file_emi_csv = %tables + "\sp_eq_emi.csv"
' sp_eq_emi.save(t=csv) {%file_emi_csv}

'================= IB ======================
freeze(sp_eq_ib) eq_ib.output
%file_ib = %tables + "\sp_eq_ib.html"
sp_eq_ib.save(t=html) {%file_ib}
' %file_ib_csv = %tables + "\sp_eq_ib.csv"
' sp_eq_ib.save(t=csv) {%file_ib_csv}

'================= IPRIVR ==================
freeze(sp_eq_iprivr) eq_iprivr.output
%file_iprivr = %tables + "\sp_eq_iprivr.html"
sp_eq_iprivr.save(t=html) {%file_iprivr}
' %file_iprivr_csv = %tables + "\sp_eq_iprivr.csv"
' sp_eq_iprivr.save(t=csv) {%file_iprivr_csv}

'================= ITCR ====================
freeze(sp_eq_itcr) eq_itcr.output
%file_itcr = %tables + "\sp_eq_itcr.html"
sp_eq_itcr.save(t=html) {%file_itcr}
' %file_itcr_csv = %tables + "\sp_eq_itcr.csv"
' sp_eq_itcr.save(t=csv) {%file_itcr_csv}

'================= M3 ======================
freeze(sp_eq_m3) eq_m3.output
%file_m3 = %tables + "\sp_eq_m3.html"
sp_eq_m3.save(t=html) {%file_m3}
' %file_m3_csv = %tables + "\sp_eq_m3.csv"
' sp_eq_m3.save(t=csv) {%file_m3_csv}

'================= PHILLIPS ================
freeze(sp_eq_phillips) eq_phillips.output
%file_phillips = %tables + "\sp_eq_phillips.html"
sp_eq_phillips.save(t=html) {%file_phillips}
' %file_phillips_csv = %tables + "\sp_eq_phillips.csv"
' sp_eq_phillips.save(t=csv) {%file_phillips_csv}

