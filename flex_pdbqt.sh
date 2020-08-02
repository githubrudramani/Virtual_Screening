#!/bin/bash
for p in {0..9}
 do
 /home/rpokhrel/Downloads/mgltools_x86_64Linux2_1.5.6/bin/pythonsh /home/rpokhrel/Downloads/mgltools_x86_64Linux2_1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_flexreceptor4.py -r Receptors/${p}.pdbqt -s ARG181_GLN182_GLN218_LYS10_GLU121_ASN520_SER213_SER12_THR330_HSD60_GLN323 -g  Receptors/${p}_rigid.pdbqt -x Receptors/${p}_flex.pdbqt
 done
