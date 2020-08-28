#!/bin/bash

export SCRAM_ARCH=slc6_amd64_gcc700
export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
source ${VO_CMS_SW_DIR}/cmsset_default.sh
cd /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src
eval `scram runtime -sh`

seed=$(($(date +%s) % 100 + 1))  

echo $seed

MASS="400" # 1800 3800 5000 6000"

start=`date +%Y/%M/%D_%H:%M:%S` echo $start

for m in $MASS ; do
cmsDriver.py \
Configuration/GenProduction/python/WprimeToMuNu_M-${m}_NNPDF31nnlo_TuneCP5_13TeV_madgraph_cff.py \
--mc --eventcontent RAWSIM,LHE \
--datatier GEN-SIM,LHE \
--conditions 102X_upgrade2018_realistic_v9 \
--beamspot Realistic25ns13TeVEarly2018Collision \
--step LHE,GEN,SIM \
--geometry DB:Extended \
--era Run2_2018  \
--fileout file:WprimeToMuNu_M-${m}_step1.root \
--python_filename WprimeToMuNu_M-${m}_step1_cfg.py \
-n 5 \
--no_exec \
--customise Configuration/DataProcessing/Utils.addMonitoring \
--customise_commands process.RandomNumberGeneratorService.externalLHEProducer.initialSeed="int(${seed})" 

done
