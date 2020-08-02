#!/usr/bin/perl

### Create Folder

#print `mkdir ./Output-Files`;

### Store logfiles in Array
#`ls *.log > loglist.txt`;
`ls | grep '\.log' > loglist.txt`; #Fixes --Argument list too long-- error with ls *.*

$infile="loglist.txt";
open(IN, "$infile") or die;

open(my $scoreout, '>', 'score.out');


$lc=0;
$line = 0;
$good = 0;

#count logfile list for showing progress ####################################
open(loglist, "loglist.txt") or die;
while(<loglist>){};
$loglines=$.;
close loglist;
print "Scoring and sorting $loglines ligand molecules ...\n";
print "0   10    20   30   40   50   60   70   80   90  100% \n";
print "|----|----|----|----|----|----|----|----|----|----|\n"; #progress-bar

#############################################################################


while(<IN>){
	 s/\n+//gm; 
	push (@logfilename, $_);
    $filename = $_;
    
    if($.%($loglines/50)==0){print "=";}; # Show progress.
    
    $score = `grep -i "   1     " $filename`;
    
    #Ignore the bad logfile##########
    #count number of lines in logfile
    open(LOGF, "$filename") or die;
    while(<LOGF>){};
    $lc=$.;
     #print $lc;
    close LOGF;
    #################################
   
    
    if ($lc>16){
         print $scoreout "$filename \t $score";
        $lc=0;
        $good++;
        }
    $line++;

    }
close IN;
close scoreout;

`sort -n -k3 score.out >score1.out`;

open my $fh, "<", "score1.out" or print "file not found";
open my $out, ">", "scoresort.txt" or die;


while (<$fh>){
    chomp;
    my @F = split ' ',$_, $_;
    print $out "$F[2] \t $F[0]\n";
}
`rm score.out score1.out`;
print "*\n";

print "---------Best 50 hits:-------- \n";
print "------------------------------ \n";
print `head -50 scoresort.txt`;
print "------------------------------ \n";

print "Yay! Scored and sorted $good ligands (out of $loglines attempted)! \n";





