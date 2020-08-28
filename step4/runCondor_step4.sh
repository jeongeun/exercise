#!/bin/bash
export SCRAM_ARCH=slc6_amd64_gcc700
export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
source $VO_CMS_SW_DIR/cmsset_default.sh
cd /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src
eval `scramv1 runtime -sh`
cd /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2
RunIdx=$1
if [ $RunIdx == 0 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1_46488_0.root ; 
fi
if [ $RunIdx == 1 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_101_46488_1.root ; 
fi
if [ $RunIdx == 2 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_201_46488_2.root ; 
fi
if [ $RunIdx == 3 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_301_46488_3.root ; 
fi
if [ $RunIdx == 4 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_401_46488_4.root ; 
fi
if [ $RunIdx == 5 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_501_46488_5.root ; 
fi
if [ $RunIdx == 6 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_601_46488_6.root ; 
fi
if [ $RunIdx == 7 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_701_46488_7.root ; 
fi
if [ $RunIdx == 8 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_801_46488_8.root ; 
fi
if [ $RunIdx == 9 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_901_46488_9.root ; 
fi
if [ $RunIdx == 10 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1001_46488_10.root ; 
fi
if [ $RunIdx == 11 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1101_46488_11.root ; 
fi
if [ $RunIdx == 12 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1201_46488_12.root ; 
fi
if [ $RunIdx == 13 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1301_46488_13.root ; 
fi
if [ $RunIdx == 14 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1401_46488_14.root ; 
fi
if [ $RunIdx == 15 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1501_46488_15.root ; 
fi
if [ $RunIdx == 16 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1601_46488_16.root ; 
fi
if [ $RunIdx == 17 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1701_46488_17.root ; 
fi
if [ $RunIdx == 18 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1801_46488_18.root ; 
fi
if [ $RunIdx == 19 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_1901_46488_19.root ; 
fi
if [ $RunIdx == 20 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_2001_46488_20.root ; 
fi
if [ $RunIdx == 21 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_2101_46488_21.root ; 
fi
if [ $RunIdx == 22 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_2201_46488_22.root ; 
fi
if [ $RunIdx == 23 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_2301_46488_23.root ; 
fi
if [ $RunIdx == 24 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_2401_46488_24.root ; 
fi
if [ $RunIdx == 25 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_2501_46488_25.root ; 
fi
if [ $RunIdx == 26 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_2601_46488_26.root ; 
fi
if [ $RunIdx == 27 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_2701_46488_27.root ; 
fi
if [ $RunIdx == 28 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_2801_46488_28.root ; 
fi
if [ $RunIdx == 29 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_2901_46488_29.root ; 
fi
if [ $RunIdx == 30 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_3001_46488_30.root ; 
fi
if [ $RunIdx == 31 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_3101_46488_31.root ; 
fi
if [ $RunIdx == 32 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_3201_46488_32.root ; 
fi
if [ $RunIdx == 33 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_3301_46488_33.root ; 
fi
if [ $RunIdx == 34 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_3401_46488_34.root ; 
fi
if [ $RunIdx == 35 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_3501_46488_35.root ; 
fi
if [ $RunIdx == 36 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_3601_46488_36.root ; 
fi
if [ $RunIdx == 37 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_3701_46488_37.root ; 
fi
if [ $RunIdx == 38 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_3801_46488_38.root ; 
fi
if [ $RunIdx == 39 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_3901_46488_39.root ; 
fi
if [ $RunIdx == 40 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_4001_46488_40.root ; 
fi
if [ $RunIdx == 41 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_4101_46488_41.root ; 
fi
if [ $RunIdx == 42 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_4201_46488_42.root ; 
fi
if [ $RunIdx == 43 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_4301_46488_43.root ; 
fi
if [ $RunIdx == 44 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_4401_46488_44.root ; 
fi
if [ $RunIdx == 45 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_4501_46488_45.root ; 
fi
if [ $RunIdx == 46 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_4601_46488_46.root ; 
fi
if [ $RunIdx == 47 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_4701_46488_47.root ; 
fi
if [ $RunIdx == 48 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_4801_46488_48.root ; 
fi
if [ $RunIdx == 49 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_4901_46488_49.root ; 
fi
if [ $RunIdx == 50 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_5001_46488_50.root ; 
fi
if [ $RunIdx == 51 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_5101_46488_51.root ; 
fi
if [ $RunIdx == 52 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_5201_46488_52.root ; 
fi
if [ $RunIdx == 53 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_5301_46488_53.root ; 
fi
if [ $RunIdx == 54 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_5401_46488_54.root ; 
fi
if [ $RunIdx == 55 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_5501_46488_55.root ; 
fi
if [ $RunIdx == 56 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_5601_46488_56.root ; 
fi
if [ $RunIdx == 57 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_5701_46488_57.root ; 
fi
if [ $RunIdx == 58 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_5801_46488_58.root ; 
fi
if [ $RunIdx == 59 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_5901_46488_59.root ; 
fi
if [ $RunIdx == 60 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_6001_46488_60.root ; 
fi
if [ $RunIdx == 61 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_6101_46488_61.root ; 
fi
if [ $RunIdx == 62 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_6201_46488_62.root ; 
fi
if [ $RunIdx == 63 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_6301_46488_63.root ; 
fi
if [ $RunIdx == 64 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_6401_46488_64.root ; 
fi
if [ $RunIdx == 65 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_6501_46488_65.root ; 
fi
if [ $RunIdx == 66 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_6601_46488_66.root ; 
fi
if [ $RunIdx == 67 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_6701_46488_67.root ; 
fi
if [ $RunIdx == 68 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_6801_46488_68.root ; 
fi
if [ $RunIdx == 69 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_6901_46488_69.root ; 
fi
if [ $RunIdx == 70 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_7001_46488_70.root ; 
fi
if [ $RunIdx == 71 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_7101_46488_71.root ; 
fi
if [ $RunIdx == 72 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_7201_46488_72.root ; 
fi
if [ $RunIdx == 73 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_7301_46488_73.root ; 
fi
if [ $RunIdx == 74 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_7401_46488_74.root ; 
fi
if [ $RunIdx == 75 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_7501_46488_75.root ; 
fi
if [ $RunIdx == 76 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_7601_46488_76.root ; 
fi
if [ $RunIdx == 77 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_7701_46488_77.root ; 
fi
if [ $RunIdx == 78 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_7801_46488_78.root ; 
fi
if [ $RunIdx == 79 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_7901_46488_79.root ; 
fi
if [ $RunIdx == 80 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_8001_46488_80.root ; 
fi
if [ $RunIdx == 81 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_8101_46488_81.root ; 
fi
if [ $RunIdx == 82 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_8201_46488_82.root ; 
fi
if [ $RunIdx == 83 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_8301_46488_83.root ; 
fi
if [ $RunIdx == 84 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_8401_46488_84.root ; 
fi
if [ $RunIdx == 85 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_8501_46488_85.root ; 
fi
if [ $RunIdx == 86 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_8601_46488_86.root ; 
fi
if [ $RunIdx == 87 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_8701_46488_87.root ; 
fi
if [ $RunIdx == 88 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_8801_46488_88.root ; 
fi
if [ $RunIdx == 89 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_8901_46488_89.root ; 
fi
if [ $RunIdx == 90 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_9001_46488_90.root ; 
fi
if [ $RunIdx == 91 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_9101_46488_91.root ; 
fi
if [ $RunIdx == 92 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_9201_46488_92.root ; 
fi
if [ $RunIdx == 93 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_9301_46488_93.root ; 
fi
if [ $RunIdx == 94 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_9401_46488_94.root ; 
fi
if [ $RunIdx == 95 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_9501_46488_95.root ; 
fi
if [ $RunIdx == 96 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_9601_46488_96.root ; 
fi
if [ $RunIdx == 97 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_9701_46488_97.root ; 
fi
if [ $RunIdx == 98 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_9801_46488_98.root ; 
fi
if [ $RunIdx == 99 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_9901_46488_99.root ; 
fi
if [ $RunIdx == 100 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_10001_46488_100.root ; 
fi
if [ $RunIdx == 101 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_10101_46488_101.root ; 
fi
if [ $RunIdx == 102 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_10201_46488_102.root ; 
fi
if [ $RunIdx == 103 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_10301_46488_103.root ; 
fi
if [ $RunIdx == 104 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_10401_46488_104.root ; 
fi
if [ $RunIdx == 105 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_10501_46488_105.root ; 
fi
if [ $RunIdx == 106 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_10601_46488_106.root ; 
fi
if [ $RunIdx == 107 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_10701_46488_107.root ; 
fi
if [ $RunIdx == 108 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_10801_46488_108.root ; 
fi
if [ $RunIdx == 109 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_10901_46488_109.root ; 
fi
if [ $RunIdx == 110 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_11001_46488_110.root ; 
fi
if [ $RunIdx == 111 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_11101_46488_111.root ; 
fi
if [ $RunIdx == 112 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_11201_46488_112.root ; 
fi
if [ $RunIdx == 113 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_11301_46488_113.root ; 
fi
if [ $RunIdx == 114 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_11401_46488_114.root ; 
fi
if [ $RunIdx == 115 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_11501_46488_115.root ; 
fi
if [ $RunIdx == 116 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_11601_46488_116.root ; 
fi
if [ $RunIdx == 117 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_11701_46488_117.root ; 
fi
if [ $RunIdx == 118 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_11801_46488_118.root ; 
fi
if [ $RunIdx == 119 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_11901_46488_119.root ; 
fi
if [ $RunIdx == 120 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_12001_46488_120.root ; 
fi
if [ $RunIdx == 121 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_12101_46488_121.root ; 
fi
if [ $RunIdx == 122 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_12201_46488_122.root ; 
fi
if [ $RunIdx == 123 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_12301_46488_123.root ; 
fi
if [ $RunIdx == 124 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_12401_46488_124.root ; 
fi
if [ $RunIdx == 125 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_12501_46488_125.root ; 
fi
if [ $RunIdx == 126 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_12601_46488_126.root ; 
fi
if [ $RunIdx == 127 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_12701_46488_127.root ; 
fi
if [ $RunIdx == 128 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_12801_46488_128.root ; 
fi
if [ $RunIdx == 129 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_12901_46488_129.root ; 
fi
if [ $RunIdx == 130 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_13001_46488_130.root ; 
fi
if [ $RunIdx == 131 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_13101_46488_131.root ; 
fi
if [ $RunIdx == 132 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_13201_46488_132.root ; 
fi
if [ $RunIdx == 133 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_13301_46488_133.root ; 
fi
if [ $RunIdx == 134 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_13401_46488_134.root ; 
fi
if [ $RunIdx == 135 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_13501_46488_135.root ; 
fi
if [ $RunIdx == 136 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_13601_46488_136.root ; 
fi
if [ $RunIdx == 137 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_13701_46488_137.root ; 
fi
if [ $RunIdx == 138 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_13801_46488_138.root ; 
fi
if [ $RunIdx == 139 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_13901_46488_139.root ; 
fi
if [ $RunIdx == 140 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_14001_46488_140.root ; 
fi
if [ $RunIdx == 141 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_14101_46488_141.root ; 
fi
if [ $RunIdx == 142 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_14201_46488_142.root ; 
fi
if [ $RunIdx == 143 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_14301_46488_143.root ; 
fi
if [ $RunIdx == 144 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_14401_46488_144.root ; 
fi
if [ $RunIdx == 145 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_14501_46488_145.root ; 
fi
if [ $RunIdx == 146 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_14601_46488_146.root ; 
fi
if [ $RunIdx == 147 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_14701_46488_147.root ; 
fi
if [ $RunIdx == 148 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_14801_46488_148.root ; 
fi
if [ $RunIdx == 149 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_14901_46488_149.root ; 
fi
if [ $RunIdx == 150 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_15001_46488_150.root ; 
fi
if [ $RunIdx == 151 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_15101_46488_151.root ; 
fi
if [ $RunIdx == 152 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_15201_46488_152.root ; 
fi
if [ $RunIdx == 153 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_15301_46488_153.root ; 
fi
if [ $RunIdx == 154 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_15401_46488_154.root ; 
fi
if [ $RunIdx == 155 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_15501_46488_155.root ; 
fi
if [ $RunIdx == 156 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_15601_46488_156.root ; 
fi
if [ $RunIdx == 157 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_15701_46488_157.root ; 
fi
if [ $RunIdx == 158 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_15801_46488_158.root ; 
fi
if [ $RunIdx == 159 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_15901_46488_159.root ; 
fi
if [ $RunIdx == 160 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_16001_46488_160.root ; 
fi
if [ $RunIdx == 161 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_16101_46488_161.root ; 
fi
if [ $RunIdx == 162 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_16201_46488_162.root ; 
fi
if [ $RunIdx == 163 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_16301_46488_163.root ; 
fi
if [ $RunIdx == 164 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_16401_46488_164.root ; 
fi
if [ $RunIdx == 165 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_16501_46488_165.root ; 
fi
if [ $RunIdx == 166 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_16601_46488_166.root ; 
fi
if [ $RunIdx == 167 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_16701_46488_167.root ; 
fi
if [ $RunIdx == 168 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_16801_46488_168.root ; 
fi
if [ $RunIdx == 169 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_16901_46488_169.root ; 
fi
if [ $RunIdx == 170 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_17001_46488_170.root ; 
fi
if [ $RunIdx == 171 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_17101_46488_171.root ; 
fi
if [ $RunIdx == 172 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_17201_46488_172.root ; 
fi
if [ $RunIdx == 173 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_17301_46488_173.root ; 
fi
if [ $RunIdx == 174 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_17401_46488_174.root ; 
fi
if [ $RunIdx == 175 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_17501_46488_175.root ; 
fi
if [ $RunIdx == 176 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_17601_46488_176.root ; 
fi
if [ $RunIdx == 177 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_17701_46488_177.root ; 
fi
if [ $RunIdx == 178 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_17801_46488_178.root ; 
fi
if [ $RunIdx == 179 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_17901_46488_179.root ; 
fi
if [ $RunIdx == 180 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_18001_46488_180.root ; 
fi
if [ $RunIdx == 181 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_18101_46488_181.root ; 
fi
if [ $RunIdx == 182 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_18201_46488_182.root ; 
fi
if [ $RunIdx == 183 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_18301_46488_183.root ; 
fi
if [ $RunIdx == 184 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_18401_46488_184.root ; 
fi
if [ $RunIdx == 185 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_18501_46488_185.root ; 
fi
if [ $RunIdx == 186 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_18601_46488_186.root ; 
fi
if [ $RunIdx == 187 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_18701_46488_187.root ; 
fi
if [ $RunIdx == 188 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_18801_46488_188.root ; 
fi
if [ $RunIdx == 189 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_18901_46488_189.root ; 
fi
if [ $RunIdx == 190 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_19001_46488_190.root ; 
fi
if [ $RunIdx == 191 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_19101_46488_191.root ; 
fi
if [ $RunIdx == 192 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_19201_46488_192.root ; 
fi
if [ $RunIdx == 193 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_19301_46488_193.root ; 
fi
if [ $RunIdx == 194 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_19401_46488_194.root ; 
fi
if [ $RunIdx == 195 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_19501_46488_195.root ; 
fi
if [ $RunIdx == 196 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_19601_46488_196.root ; 
fi
if [ $RunIdx == 197 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_19701_46488_197.root ; 
fi
if [ $RunIdx == 198 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_19801_46488_198.root ; 
fi
if [ $RunIdx == 199 ]; then
source runMiniaod.sh 5000 /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2/condorOut/step3_step2_step1_WprimeToENu_M-5000_1_19901_46488_199.root ; 
fi
