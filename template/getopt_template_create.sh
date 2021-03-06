echo "create getopt_template ..."
if [ "1" ] ; then 
echo 'h   | printHelp()'
echo 'v   | verbose_print=1'
echo 's   | single_side=1'
echo 'S   | is_surf=1'
echo 'i:  | infile=optarg'
echo 'o:  | outfile=optarg'
echo 'c:  | c=atoi(optarg)'
echo 'A:  | alpha=atof(optarg)'
echo 'B:  | beta=atof(optarg)'
echo 'G:  | gamma=atof(optarg)'
echo 'n:  | nloops=atoi(optarg)'
echo 'k:  | keep_which=(strcmp(optarg,"left")!=0)'
echo 'N:  | nctrls=atoi(optarg)'
fi > getopt_template

