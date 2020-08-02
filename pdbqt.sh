#!/bin/bash
for p in {0..100}
 do
 /home/rpokhrel/Downloads/mgltools_x86_64Linux2_1.5.6/bin/pythonsh /home/rpokhrel/Downloads/mgltools_x86_64Linux2_1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py -r Receptors/${p}.pdb -o  Receptors/${p}.pdbqt 
 done 
