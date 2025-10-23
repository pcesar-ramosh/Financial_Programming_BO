'Programacion Financiera RAF

close @all

%path = @runpath
cd %path

'cd "C:\Cesar\UAEF_RAF\Programa Financiero"

wfopen "monet models.wf1"

'Equation - eq_cprivr
equation eq_cprivr.ls dlog(cprivr) c @lag(dlog(cprivr),1) dlog(pibr) ipasr d92 d97 d99 d19 d20 d21
'Equation - eq_defcpub 
equation eq_defcpub.ls dlog(def_cpub) c dlog(ipc) inc_sal d98 d03 d16
'Equation - eq_defcpriv
equation eq_defcpriv.ls dlog(defcpriv) c dlog(ipc) d91 d96 d06 d10 d11 d16 d24
'Equation - defipriv
equation eq_defipriv.ls dlog(defipriv) c dlog(ipc) dlog(def_impor) d00 d03 d04 d05
'Equation - defipub
equation eq_defipub.ls dlog(def_ipub) c dlog(ipc) dlog(def_impor) d00 d02 d06 d08 d24
'Equation - emi
equation eq_emi.ls dlog(emi) c @lag(dlog(emi),1) inf_gap(-1) pib_gap(-1) d94 d05 d07 d20 d21 d23 d24
'Equation - ib
equation eq_ib.ls d(ib) c dlog(emi) dlog(pibr) dlog(ipc) d00 d09 d19 d20 d23 d02 d14 d15 d17
'Equation - iprivr
equation eq_iprivr.ls dlog(iprivr) c @lag(dlog(iprivr),1) dlog(pibr) iactr d90 d91 d93 d95 d97 d98 d99 d02
'Equation - itcr
equation eq_itcr.ls dlog(itcr) c dlog(tc) dlog(dxy) inf_mundo dlog(ipc) d02 d05 d10 d22
'Equation - m3
equation eq_m3.ls dlog(m3) c @lag(dlog(m3),1) dlog(ipc) dlog(pibr) ib d08 d09 d16 d20
'Equation - phillips
equation eq_phillips.ls dlog(ipc) c @lag(dlog(ipc),1) pib_gap dlog(itcr) d92 d95 d02 d07 d08 d09 d10 d13 d20 d21 d24

' Create the New Page for Prog Fin
pagecreate(page=Update_progfin) a 1988 2024

pageselect Update_progfin
copy Untitled\CPRIVR *
copy Untitled\DEF_CPUB *
copy Untitled\DEF_IMPOR *
copy Untitled\DEF_IPUB *
copy Untitled\DEFCPRIV *
copy Untitled\DEFIPRIV *
copy Untitled\DXY *
copy Untitled\EMI *
copy Untitled\EMIR *
copy Untitled\IACTR *
copy Untitled\IACTR1 *
copy Untitled\IB *
copy Untitled\IBR *
copy Untitled\INC_SAL *
copy Untitled\INF *
copy Untitled\INF_EXP *
copy Untitled\INF_GAP *
copy Untitled\INF_MUNDO *
copy Untitled\INF_P *
copy Untitled\IPASR *
copy Untitled\IPC *
