#!/bin/bash

echo "#!/bin/bash"
echo "export SCRAM_ARCH=slc6_amd64_gcc700"
echo "export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch"
echo "source \$VO_CMS_SW_DIR/cmsset_default.sh"
echo "cd /cvmfs/cms.cern.ch/slc6_amd64_gcc700/cms/cmssw/CMSSW_10_2_5"
echo "eval \`scramv1 runtime -sh\`"
echo "cd /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_5/src "
echo "RunIdx=\$1"
Mass=$1
InputDataList=$2
for (( i=0; i<200; i++ )); do
  NumLine=`expr $i + 1`
  echo "if [ "\$RunIdx" == "$i" ]; then"
  inputFile=`sed  -n ${NumLine}p "$InputDataList" `;
  
  echo "source runStep2.sh ${Mass} ${inputFile}  Neutrino_E-10_gun_D_RunIISummer17PrePremix-PUAutumn18_102X_upgrade2018_realistic_v15-v1_D_GEN-SIM-DIGI-RAW.txt  ; "
  echo "fi"
done

#echo "chmod   +x runCondor.sh"
#echo "find . -maxdepth 1 -type d -exec chmod 777 {} ;"
#echo "find . -maxdepth 1 -name "*.dat" -exec chmod 744 {} ;"
#echo "find . -maxdepth 1 -name "*.sh" -exec chmod 744 {} ;"



#executable = run_Step1.sh
#universe = vanilla
#output   = condorLog/condorLog_$(Cluster)_$(Process).out
#error    = condorLog/condorLog_$(Cluster)_$(Process).err
##log      = condorLog/condorLog_$(Cluster)_$(Process).log
#log      = /dev/null
#use_x509userproxy = True
##request_disk = 4 GB
#should_transfer_files = yes
#when_to_transfer_output = ON_EXIT
#transfer_output_files = condorOut
#transfer_output_remaps = "condorOut=condorOut_$(Cluster)"
#requirements = (machine != "node06")
##arguments = $wpmass  $FirstRun $nEvt $Cluster $Process $ProcessStart


#cat << EOF > job.jdl
#executable = condorRun.sh 
#universe = vanilla  
#arguments = \$(Process) 
#output   = condorLog/condor_\$(Cluster).\$(Process).log  
#error    = condorLog/condor_\$(Cluster).\$(Process).log
#log      = /dev/null
#should_transfer_files = yes
#when_to_transfer_output = ON_EXIT
#getenv = true
#queue 3
#EOF
#
#     echo "condor_submit job.jdl 2>&1 | tee jobID.log"

