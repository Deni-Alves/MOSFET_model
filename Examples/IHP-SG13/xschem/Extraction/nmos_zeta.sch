v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 14 70 80 70 290 {}
L 14 70 290 700 290 {}
L 14 700 60 700 290 {}
L 14 70 60 700 60 {}
L 14 70 60 70 80 {}
T {tcleval(qS: [xschem raw value qS 0])} 505 155 0 0 0.4 0.4 {floater=1 layer=15}
T {tcleval(zeta: [xschem raw value zeta 0])} 565 -135 0 0 0.4 0.4 {floater=1 layer=7}
T {tcleval(idsat: [xschem raw value idsat 0])} 505 125 0 0 0.4 0.4 {floater=1 layer=15}
T {ACM2 using 4PM
to calculate qS} 85 75 0 0 0.4 0.4 {layer=14}
N 360 -60 380 -60 {
lab=#net1}
N 420 -10 420 10 {
lab=GND}
N 420 -60 430 -60 {
lab=GND}
N 430 -60 430 -10 {
lab=GND}
N 420 -10 430 -10 {
lab=GND}
N 270 -20 270 0 {
lab=GND}
N 420 -110 420 -90 {
lab=#net2}
N 360 -170 360 -60 {
lab=#net1}
N 360 -170 420 -170 {
lab=#net1}
N 270 -170 270 -80 {
lab=#net1}
N 270 -170 360 -170 {
lab=#net1}
N 290 200 290 220 {
lab=GND}
N 290 90 290 140 {
lab=#net3}
N 350 90 420 90 {
lab=#net3}
N 420 90 420 110 {
lab=#net3}
N 350 140 380 140 {
lab=#net3}
N 350 90 350 140 {
lab=#net3}
N 420 190 420 210 {
lab=GND}
N 420 140 430 140 {
lab=GND}
N 430 140 430 190 {
lab=GND}
N 420 190 430 190 {
lab=GND}
N 420 -30 420 -10 {
lab=GND}
N 290 90 350 90 {
lab=#net3}
N 420 170 420 190 {
lab=GND}
C {devices/vsource.sym} 270 -50 0 0 {name=VDD value=1.5 savecurrent=false}
C {devices/launcher.sym} 620 -170 0 0 {name=h1
descr="Ctrl-Left-Click to Show" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"}
C {devices/code.sym} 20 -110 0 0 {name=NGSPICE only_toplevel=true

value="

.control
pre_osdi /home/gmaranhao/Documents/MOSFET_model/Verilog-A/NMOS_ACM_2V0.osdi
pre_osdi ./psp103_nqs.osdi
save all

op

let IDsat_=i(V_ID)
save IDsat_

let IS=@n1[is]
save IS

let qS=@n1[qS_op]
save qS

let idsat=IDsat_/IS
save idsat

let sqr=sqrt(1+idsat)
save sqr

let aux1 = 2*(qS+1-sqr)
save aux1

let zeta = aux1/idsat
save zeta

set appenwrite
write nmos_zeta.raw


.endc
"}
C {devices/gnd.sym} 420 10 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 270 0 0 0 {name=l2 lab=GND}
C {devices/ammeter.sym} 420 -140 0 0 {name=V_ID savecurrent=true}
C {devices/vsource.sym} 290 170 0 0 {name=VDD_acm value=1.5 savecurrent=false}
C {devices/gnd.sym} 290 220 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 420 210 0 0 {name=l4 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 400 -60 0 0 {name=M1
L=0.12u
W=10.0u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/code_shown.sym} 10 -330 0 0 {name=MODELS1 only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
.model NMOS_ACM nmos_ACM
.model PMOS_ACM pmos_ACM
"}
C {/home/gmaranhao/Documents/MOSFET_model/Examples/IHP-SG13/xschem/symbol/nmos_acm.sym} 410 140 0 0 {name=N1 
model=NMOS_ACM 
w=10u 
l=0.12u 
n=1.41
is=11.7u 
vt0=0.490
sigma=52.8m 
zeta=1p
}
