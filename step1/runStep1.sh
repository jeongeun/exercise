#!/bin/bash

echo "`whoami` `pwd` `hostname`"
TopDir=`pwd`
export SCRAM_ARCH=slc6_amd64_gcc700
export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
source $VO_CMS_SW_DIR/cmsset_default.sh

cd /x3/cms/jelee/MCProd/VPrime_NLO_MG/run/CMSSW_10_2_12_patch1/src
eval `scram runtime -sh`
cd -
echo "CMSSW_BASE ${CMSSW_BASE}"
cd $TopDir

export mass=${1}
export firstRun=${2}
export nEvt=${3}
export CluID=${4}
export ProID=`expr ${5} + ${6}`
export firstEvent=`expr ${nEvt} \* ${ProID} + 1`
export firstLumi=`expr ${ProID} + 1`

AddName=${firstRun}_${firstEvent}_${CluID}_${ProID}
rootFile=step1_WprimeToENu_M-${mass}_${AddName}.root        
rootLHEFile=step1_WprimeToENu_M-${mass}_${AddName}_inLHE.root
cfgFile=step1_WprimeToENu_M-${mass}_${AddName}.py      

cat << EOF > ${cfgFile}
# Auto generated configuration file
# using: 
# Revision: 1.19 
# Source: /local/reps/CMSSW/CMSSW/Configuration/Applications/python/ConfigBuilder.py,v 
# with command line options: Configuration/GenProduction/python/WprimeToENu_M-400_NNPDF31nnlo_TuneCP5_13TeV_madgraph_cff.py --mc --eventcontent RAWSIM,LHE --datatier GEN-SIM,LHE --conditions 102X_upgrade2018_realistic_v9 --beamspot Realistic25ns13TeVEarly2018Collision --step LHE,GEN,SIM --geometry DB:Extended --era Run2_2018 --fileout file:WprimeToENu_M-400_step1.root --python_filename WprimeToENu_M-400_step1_cfg.py -n 5 --no_exec
import FWCore.ParameterSet.Config as cms

from Configuration.StandardSequences.Eras import eras

process = cms.Process('SIM',eras.Run2_2018)

# import of standard configurations
process.load('Configuration.StandardSequences.Services_cff')
process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContent_cff')
process.load('SimGeneral.MixingModule.mixNoPU_cfi')
process.load('Configuration.StandardSequences.GeometryRecoDB_cff')
process.load('Configuration.StandardSequences.GeometrySimDB_cff')
process.load('Configuration.StandardSequences.MagneticField_cff')
process.load('Configuration.StandardSequences.Generator_cff')
process.load('IOMC.EventVertexGenerators.VtxSmearedRealistic25ns13TeVEarly2018Collision_cfi')
process.load('GeneratorInterface.Core.genFilterSummary_cff')
process.load('Configuration.StandardSequences.SimIdeal_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(${nEvt})
)

# Input source
process.source = cms.Source("EmptySource", 
		firstRun=cms.untracked.uint32(${firstRun}), 
		## firstLuminosityBlock=cms.untracked.uint32(${firstLumi}),
		firstEvent=cms.untracked.uint32(${firstEvent})

                #numberEventsInRun = cms.untracked.uint32(${nEvt}),
		#numberEventsInLuminosityBlock = cms.untracked.uint32(${nEvt})

)

###https://github.com/MiT-HEP/MCProduction/blob/master/Moriond18_LHE_MINIAOD/GluGlu_MH125/step1.py
###process.source = cms.Source("EmptySource", firstLuminosityBlock=cms.untracked.uint32(${firstRun}), numberEventsInLuminosityBlock = cms.untracked.uint32(${nEvt} )  


# Set different random numbers seeds every time one runs cmsRun
from IOMC.RandomEngine.RandomServiceHelper import RandomNumberServiceHelper
randSvc = RandomNumberServiceHelper(process.RandomNumberGeneratorService)
randSvc.populate()


process.options = cms.untracked.PSet(

)

# Production Info
process.configurationMetadata = cms.untracked.PSet(
    version = cms.untracked.string('\$Revision: 1.19 \$'),
    annotation = cms.untracked.string('Configuration/GenProduction/python/WprimeToENu_M-${mass}_NNPDF31nnlo_TuneCP5_13TeV_madgraph_cff.py nevts:50'),
    name = cms.untracked.string('Applications')
)

# Output definition

process.RAWSIMoutput = cms.OutputModule("PoolOutputModule",
    splitLevel = cms.untracked.int32(0),
    eventAutoFlushCompressedSize = cms.untracked.int32(20971520),
    outputCommands = process.RAWSIMEventContent.outputCommands,
    fileName = cms.untracked.string('file:${rootFile}'),
    dataset = cms.untracked.PSet(
        filterName = cms.untracked.string(''),
        dataTier = cms.untracked.string('GEN-SIM')
    ),
    SelectEvents = cms.untracked.PSet(
        SelectEvents = cms.vstring('generation_step')
    ),
    compressionAlgorithm = cms.untracked.string('LZMA'),
    compressionLevel = cms.untracked.int32(1)
)

process.LHEoutput = cms.OutputModule("PoolOutputModule",
    splitLevel = cms.untracked.int32(0),
    outputCommands = process.LHEEventContent.outputCommands,
    fileName = cms.untracked.string('file:${rootLHEFile}'),
    dataset = cms.untracked.PSet(
        dataTier = cms.untracked.string('LHE'),
        filterName = cms.untracked.string('')
    )
)

# Additional output definition

# Other statements
process.XMLFromDBSource.label = cms.string("Extended")
process.genstepfilter.triggerConditions=cms.vstring("generation_step")
from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, '102X_upgrade2018_realistic_v9', '')

process.generator = cms.EDFilter("Pythia8HadronizerFilter",
    PythiaParameters = cms.PSet(
        parameterSets = cms.vstring(
            'pythia8CommonSettings', 
            'pythia8PSweightsSettings', 
            'pythia8CP5Settings'
        ),
        pythia8CP5Settings = cms.vstring(
            'Tune:pp 14', 
            'Tune:ee 7', 
            'MultipartonInteractions:ecmPow=0.03344', 
            'PDF:pSet=20', 
            'MultipartonInteractions:bProfile=2', 
            'MultipartonInteractions:pT0Ref=1.41', 
            'MultipartonInteractions:coreRadius=0.7634', 
            'MultipartonInteractions:coreFraction=0.63', 
            'ColourReconnection:range=5.176', 
            'SigmaTotal:zeroAXB=off', 
            'SpaceShower:alphaSorder=2', 
            'SpaceShower:alphaSvalue=0.118', 
            'SigmaProcess:alphaSvalue=0.118', 
            'SigmaProcess:alphaSorder=2', 
            'MultipartonInteractions:alphaSvalue=0.118', 
            'MultipartonInteractions:alphaSorder=2', 
            'TimeShower:alphaSorder=2', 
            'TimeShower:alphaSvalue=0.118'
        ),
        pythia8CommonSettings = cms.vstring(
            'Tune:preferLHAPDF = 2', 
            'Main:timesAllowErrors = 10000', 
            'Check:epTolErr = 0.01', 
            'Beams:setProductionScalesFromLHEF = off', 
            'SLHA:keepSM = on', 
            'SLHA:minMassSM = 1000.', 
            'ParticleDecays:limitTau0 = on', 
            'ParticleDecays:tau0Max = 10', 
            'ParticleDecays:allowPhotonRadiation = on'
        ),
        pythia8PSweightsSettings = cms.vstring(
            'UncertaintyBands:doVariations = on', 
            'UncertaintyBands:List = {isrRedHi isr:muRfac=0.707,fsrRedHi fsr:muRfac=0.707,isrRedLo isr:muRfac=1.414,fsrRedLo fsr:muRfac=1.414,isrDefHi isr:muRfac=0.5,fsrDefHi fsr:muRfac=0.5,isrDefLo isr:muRfac=2.0,fsrDefLo fsr:muRfac=2.0,isrConHi isr:muRfac=0.25,fsrConHi fsr:muRfac=0.25,isrConLo isr:muRfac=4.0,fsrConLo fsr:muRfac=4.0,fsr_G2GG_muR_dn fsr:G2GG:muRfac=0.5,fsr_G2GG_muR_up fsr:G2GG:muRfac=2.0,fsr_G2QQ_muR_dn fsr:G2QQ:muRfac=0.5,fsr_G2QQ_muR_up fsr:G2QQ:muRfac=2.0,fsr_Q2QG_muR_dn fsr:Q2QG:muRfac=0.5,fsr_Q2QG_muR_up fsr:Q2QG:muRfac=2.0,fsr_X2XG_muR_dn fsr:X2XG:muRfac=0.5,fsr_X2XG_muR_up fsr:X2XG:muRfac=2.0,fsr_G2GG_cNS_dn fsr:G2GG:cNS=-2.0,fsr_G2GG_cNS_up fsr:G2GG:cNS=2.0,fsr_G2QQ_cNS_dn fsr:G2QQ:cNS=-2.0,fsr_G2QQ_cNS_up fsr:G2QQ:cNS=2.0,fsr_Q2QG_cNS_dn fsr:Q2QG:cNS=-2.0,fsr_Q2QG_cNS_up fsr:Q2QG:cNS=2.0,fsr_X2XG_cNS_dn fsr:X2XG:cNS=-2.0,fsr_X2XG_cNS_up fsr:X2XG:cNS=2.0,isr_G2GG_muR_dn isr:G2GG:muRfac=0.5,isr_G2GG_muR_up isr:G2GG:muRfac=2.0,isr_G2QQ_muR_dn isr:G2QQ:muRfac=0.5,isr_G2QQ_muR_up isr:G2QQ:muRfac=2.0,isr_Q2QG_muR_dn isr:Q2QG:muRfac=0.5,isr_Q2QG_muR_up isr:Q2QG:muRfac=2.0,isr_X2XG_muR_dn isr:X2XG:muRfac=0.5,isr_X2XG_muR_up isr:X2XG:muRfac=2.0,isr_G2GG_cNS_dn isr:G2GG:cNS=-2.0,isr_G2GG_cNS_up isr:G2GG:cNS=2.0,isr_G2QQ_cNS_dn isr:G2QQ:cNS=-2.0,isr_G2QQ_cNS_up isr:G2QQ:cNS=2.0,isr_Q2QG_cNS_dn isr:Q2QG:cNS=-2.0,isr_Q2QG_cNS_up isr:Q2QG:cNS=2.0,isr_X2XG_cNS_dn isr:X2XG:cNS=-2.0,isr_X2XG_cNS_up isr:X2XG:cNS=2.0}', 
            'UncertaintyBands:nFlavQ = 4', 
            'UncertaintyBands:MPIshowers = on', 
            'UncertaintyBands:overSampleFSR = 10.0', 
            'UncertaintyBands:overSampleISR = 10.0', 
            'UncertaintyBands:FSRpTmin2Fac = 20', 
            'UncertaintyBands:ISRpTmin2Fac = 1'
        )
    ),
    comEnergy = cms.double(13000.0),
    filterEfficiency = cms.untracked.double(1.0),
    maxEventsToPrint = cms.untracked.int32(1),
    pythiaHepMCVerbosity = cms.untracked.bool(False),
    pythiaPylistVerbosity = cms.untracked.int32(1)
)


process.externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('/x3/cms/jelee/MCProd/mg26X/genproductions/bin/MadGraph5_aMCatNLO/WprimeToENu_M-${mass}_NLO_NNPDF31nnlo_slc6_amd64_gcc630_CMSSW_9_3_8_tarball.tar.xz'),
    nEvents = cms.untracked.uint32(${nEvt}),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)


process.ProductionFilterSequence = cms.Sequence(process.generator)

# Path and EndPath definitions
process.lhe_step = cms.Path(process.externalLHEProducer)
process.generation_step = cms.Path(process.pgen)
process.simulation_step = cms.Path(process.psim)
process.genfiltersummary_step = cms.EndPath(process.genFilterSummary)
process.endjob_step = cms.EndPath(process.endOfProcess)
process.RAWSIMoutput_step = cms.EndPath(process.RAWSIMoutput)
process.LHEoutput_step = cms.EndPath(process.LHEoutput)

# Schedule definition
process.schedule = cms.Schedule(process.lhe_step,process.generation_step,process.genfiltersummary_step,process.simulation_step,process.endjob_step,process.RAWSIMoutput_step,process.LHEoutput_step)
from PhysicsTools.PatAlgos.tools.helpers import associatePatAlgosToolsTask
associatePatAlgosToolsTask(process)
# filter all path with the production filter sequence
for path in process.paths:
	if path in ['lhe_step']: continue
	getattr(process,path)._seq = process.ProductionFilterSequence * getattr(process,path)._seq 


# Customisation from command line
# customisation of the process.

# Automatic addition of the customisation function from Configuration.DataProcessing.Utils
from Configuration.DataProcessing.Utils import addMonitoring 

#call to customisation function addMonitoring imported from Configuration.DataProcessing.Utils
process = addMonitoring(process)

# End of customisation functions

# Customisation from command line
import os,random
random.seed = os.urandom(10) #~10^14
process.RandomNumberGeneratorService.externalLHEProducer.initialSeed = random.randint(0,999999)
process.RandomNumberGeneratorService.generator.initialSeed = random.randint(0,999999)



# Add early deletion of temporary data products to reduce peak memory need
from Configuration.StandardSequences.earlyDeleteSettings_cff import customiseEarlyDelete
process = customiseEarlyDelete(process)
# End adding early deletion
EOF

echo "############"
pwd
ls -al
which cmsRun
echo "Run cmsRun"

cmsRun ${cfgFile} 2>&1
ls -al *.root *.py

if [ ! -d ${TopDir}/condorLog ]; then mkdir -p ${TopDir}/condorLog ; fi
if [ ! -d ${TopDir}/condorOut ]; then mkdir -p ${TopDir}/condorOut ; fi
mv *.root *.py  ${TopDir}/condorOut/

