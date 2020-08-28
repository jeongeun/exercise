#!/bin/bash 

TopDir=`pwd`
echo "`whoami` `pwd` `hostname`"
TopDir=`pwd`

export SCRAM_ARCH=slc6_amd64_gcc700
export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
export SSL_CERT_DIR='/etc/grid-security/certificates'
source $VO_CMS_SW_DIR/cmsset_default.sh

cd /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src
eval `scramv1 runtime -sh`
#cd - 2&> /dev/null
echo "CMSSW_BASE ${CMSSW_BASE}"
#cd $TopDir
cd /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src/step2

mass=${1}
inputFile=${2}
puListFile=${3}
bName=`basename ${inputFile}`
bName=${bName/.root}
cfgFile1=step2_${bName}_cfg.py
outputFile1="step2_${bName}.root"

echo "### in $inputFile ;out1 $outputFile1 ;out2 $outputFile1  ;pu $puListFile "

cat << EOF > ${cfgFile1}
# Auto generated configuration file
# using: 
# Revision: 1.19 
# Source: /local/reps/CMSSW/CMSSW/Configuration/Applications/python/ConfigBuilder.py,v 
# with command line options: step1 --mc --eventcontent PREMIXRAW --datatier GEN-SIM-RAW --conditions 102X_upgrade2018_realistic_v15 --step DIGI,DATAMIX,L1,DIGI2RAW,HLT:@relval2018 --procModifiers premix_stage2 --geometry DB:Extended --datamix PreMix --era Run2_2018 --filein file:/x3/cms/jelee/MCProd/CMSSW_10_2_3/src/WprimeToENu_M-400_step1.root --fileout file:WprimeToENu_M-400_step2.root --pileup_input dbs: /Neutrino_E-10_gun/RunIISummer17PrePremix-PUAutumn18_102X_upgrade2018_realistic_v15-v1/GEN-SIM-DIGI-RAW --python_filename WprimeToENu_M-400_step2_cfg.py --no_exec
import FWCore.ParameterSet.Config as cms

from Configuration.StandardSequences.Eras import eras
from Configuration.ProcessModifiers.premix_stage2_cff import premix_stage2

process = cms.Process('HLT',eras.Run2_2018,premix_stage2)

# import of standard configurations
process.load('Configuration.StandardSequences.Services_cff')
process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContent_cff')
process.load('SimGeneral.MixingModule.mixNoPU_cfi')
process.load('Configuration.StandardSequences.GeometryRecoDB_cff')
process.load('Configuration.StandardSequences.MagneticField_cff')
process.load('Configuration.StandardSequences.DigiDM_cff')
process.load('Configuration.StandardSequences.DataMixerPreMix_cff')
process.load('Configuration.StandardSequences.SimL1EmulatorDM_cff')
process.load('Configuration.StandardSequences.DigiToRawDM_cff')
process.load('HLTrigger.Configuration.HLT_2018v32_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(-1)
)

# Input source
process.source = cms.Source("PoolSource",
    dropDescendantsOfDroppedBranches = cms.untracked.bool(False),
    fileNames = cms.untracked.vstring('file:${inputFile}'),
    inputCommands = cms.untracked.vstring(
        'keep *', 
        'drop *_genParticles_*_*', 
        'drop *_genParticlesForJets_*_*', 
        'drop *_kt4GenJets_*_*', 
        'drop *_kt6GenJets_*_*', 
        'drop *_iterativeCone5GenJets_*_*', 
        'drop *_ak4GenJets_*_*', 
        'drop *_ak7GenJets_*_*', 
        'drop *_ak8GenJets_*_*', 
        'drop *_ak4GenJetsNoNu_*_*', 
        'drop *_ak8GenJetsNoNu_*_*', 
        'drop *_genCandidatesForMET_*_*', 
        'drop *_genParticlesForMETAllVisible_*_*', 
        'drop *_genMetCalo_*_*', 
        'drop *_genMetCaloAndNonPrompt_*_*', 
        'drop *_genMetTrue_*_*', 
        'drop *_genMetIC5GenJs_*_*'
    ),
    secondaryFileNames = cms.untracked.vstring()
)

process.options = cms.untracked.PSet(

)

# Production Info
process.configurationMetadata = cms.untracked.PSet(
    annotation = cms.untracked.string('step1 nevts:1'),
    name = cms.untracked.string('Applications'),
    version = cms.untracked.string('\$Revision: 1.19 \$')
)

# Output definition

process.PREMIXRAWoutput = cms.OutputModule("PoolOutputModule",
    dataset = cms.untracked.PSet(
        dataTier = cms.untracked.string('GEN-SIM-RAW'),
        filterName = cms.untracked.string('')
    ),
    fileName = cms.untracked.string('file:${outputFile1}'),
    outputCommands = process.PREMIXRAWEventContent.outputCommands,
    splitLevel = cms.untracked.int32(0)
)

# Additional output definition

# Other statements
import FWCore.Utilities.FileUtils as FileUtils
mylist = FileUtils.loadListFromFile ('${puListFile}')
readFiles = cms.untracked.vstring(*mylist)

#process.mix.digitizers = cms.PSet(process.theDigitizersMixPreMix)
process.mixData.input.fileNames = readFiles

from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, '102X_upgrade2018_realistic_v15', '')

# Path and EndPath definitions
process.digitisation_step = cms.Path(process.pdigi)
process.datamixing_step = cms.Path(process.pdatamix)
process.L1simulation_step = cms.Path(process.SimL1Emulator)
process.digi2raw_step = cms.Path(process.DigiToRaw)
process.endjob_step = cms.EndPath(process.endOfProcess)
process.PREMIXRAWoutput_step = cms.EndPath(process.PREMIXRAWoutput)

# Schedule definition
process.schedule = cms.Schedule(process.digitisation_step,process.datamixing_step,process.L1simulation_step,process.digi2raw_step)
process.schedule.extend(process.HLTSchedule)
process.schedule.extend([process.endjob_step,process.PREMIXRAWoutput_step])
from PhysicsTools.PatAlgos.tools.helpers import associatePatAlgosToolsTask
associatePatAlgosToolsTask(process)

# customisation of the process.

# Automatic addition of the customisation function from HLTrigger.Configuration.customizeHLTforMC
from HLTrigger.Configuration.customizeHLTforMC import customizeHLTforMC 

#call to customisation function customizeHLTforMC imported from HLTrigger.Configuration.customizeHLTforMC
process = customizeHLTforMC(process)

# End of customisation functions

# Customisation from command line

# Add early deletion of temporary data products to reduce peak memory need
from Configuration.StandardSequences.earlyDeleteSettings_cff import customiseEarlyDelete
process = customiseEarlyDelete(process)
# End adding early deletion
EOF

echo "cmsRun step2 1"
cmsRun ${cfgFile1} 2>&1 

which cmsRun
ls -ahl *.root *.py
echo "move step2 1"
#mv *.root *.py  ${TopDir}/condorOut/

#cat << EOF > ${cfgFile2}
## Auto generated configuration file
## using: 
## Revision: 1.19 
## Source: /local/reps/CMSSW/CMSSW/Configuration/Applications/python/ConfigBuilder.py,v 
## with command line options: step2 --mc --eventcontent AODSIM --runUnscheduled --datatier AODSIM --conditions 102X_upgrade2018_realistic_v15 --step RAW2DIGI,L1Reco,RECO,RECOSIM,EI --procModifiers premix_stage2 --era Run2_2018 --fileout file:step2_2.root --no_exec
#import FWCore.ParameterSet.Config as cms
#
#from Configuration.StandardSequences.Eras import eras
#from Configuration.ProcessModifiers.premix_stage2_cff import premix_stage2
#
#process = cms.Process('RECO',eras.Run2_2018,premix_stage2)
#
## import of standard configurations
#process.load('Configuration.StandardSequences.Services_cff')
#process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
#process.load('FWCore.MessageService.MessageLogger_cfi')
#process.load('Configuration.EventContent.EventContent_cff')
#process.load('SimGeneral.MixingModule.mixNoPU_cfi')
#process.load('Configuration.StandardSequences.GeometryRecoDB_cff')
#process.load('Configuration.StandardSequences.MagneticField_cff')
#process.load('Configuration.StandardSequences.RawToDigi_cff')
#process.load('Configuration.StandardSequences.L1Reco_cff')
#process.load('Configuration.StandardSequences.Reconstruction_cff')
#process.load('Configuration.StandardSequences.RecoSim_cff')
#process.load('CommonTools.ParticleFlow.EITopPAG_cff')
#process.load('Configuration.StandardSequences.EndOfProcess_cff')
#process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')
#
#process.maxEvents = cms.untracked.PSet(
#    input = cms.untracked.int32(-1)
#)
#
## Input source
#process.source = cms.Source("PoolSource",
##    fileNames = cms.untracked.vstring('file:${outputFile1}'),
#    fileNames = cms.untracked.vstring('file:/x3/cms/jelee/MCProd/VPrime_NLO_MG/step2/CMSSW_10_2_5/src/condorOut/${outputFile1}'),
#    secondaryFileNames = cms.untracked.vstring()
#)
#
#process.options = cms.untracked.PSet(
#
#)
#
## Production Info
#process.configurationMetadata = cms.untracked.PSet(
#    annotation = cms.untracked.string('step2 nevts:1'),
#    name = cms.untracked.string('Applications'),
#    version = cms.untracked.string('\$Revision: 1.19 \$')
#)
#
## Output definition
#
#process.AODSIMoutput = cms.OutputModule("PoolOutputModule",
#    compressionAlgorithm = cms.untracked.string('LZMA'),
#    compressionLevel = cms.untracked.int32(4),
#    dataset = cms.untracked.PSet(
#        dataTier = cms.untracked.string('AODSIM'),
#        filterName = cms.untracked.string('')
#    ),
#    eventAutoFlushCompressedSize = cms.untracked.int32(31457280),
#    fileName = cms.untracked.string('file:${outputFile2}'),
#    outputCommands = process.AODSIMEventContent.outputCommands
#)
#
## Additional output definition
#
## Other statements
#from Configuration.AlCa.GlobalTag import GlobalTag
#process.GlobalTag = GlobalTag(process.GlobalTag, '102X_upgrade2018_realistic_v15', '')
#
## Path and EndPath definitions
#process.raw2digi_step = cms.Path(process.RawToDigi)
#process.L1Reco_step = cms.Path(process.L1Reco)
#process.reconstruction_step = cms.Path(process.reconstruction)
#process.recosim_step = cms.Path(process.recosim)
#process.eventinterpretaion_step = cms.Path(process.EIsequence)
#process.endjob_step = cms.EndPath(process.endOfProcess)
#process.AODSIMoutput_step = cms.EndPath(process.AODSIMoutput)
#
## Schedule definition
#process.schedule = cms.Schedule(process.raw2digi_step,process.L1Reco_step,process.reconstruction_step,process.recosim_step,process.eventinterpretaion_step,process.endjob_step,process.AODSIMoutput_step)
#from PhysicsTools.PatAlgos.tools.helpers import associatePatAlgosToolsTask
#associatePatAlgosToolsTask(process)
#
##do not add changes to your config after this point (unless you know what you are doing)
#from FWCore.ParameterSet.Utilities import convertToUnscheduled
#process=convertToUnscheduled(process)
#
#
## Customisation from command line
#
##Have logErrorHarvester wait for the same EDProducers to finish as those providing data for the OutputModule
#from FWCore.Modules.logErrorHarvester_cff import customiseLogErrorHarvesterUsingOutputCommands
#process = customiseLogErrorHarvesterUsingOutputCommands(process)
#
## Add early deletion of temporary data products to reduce peak memory need
#from Configuration.StandardSequences.earlyDeleteSettings_cff import customiseEarlyDelete
#process = customiseEarlyDelete(process)
## End adding early deletion
#EOF
##chmod +x ${cfgFile2}
#
#echo "cmsRun step2 2"
#cmsRun ${cfgFile2} 2>&1
#
#
#if [ ! -d ${TopDir}/condorLog ]; then mkdir -p ${TopDir}/condorLog ; fi
#if [ ! -d ${TopDir}/condorOut ]; then mkdir -p ${TopDir}/condorOut ; fi
#ls -ahl *.root *.py
#echo "move step2 2"
#mv *.root *.py  ${TopDir}/condorOut/
#
