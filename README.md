# MCProd2018 

This recipe will produce GEN SIM level events from a MG5 gridpack using the same configuration as in the official CMSSW 2018 RunIIFall18MC production.

-- 2018 MC Campaign = (step1)-> (step2)-> (step3) ->(step4)  (https://twiki.cern.ch/twiki/bin/view/CMS/PdmVMcCampaigns) 



(1) RunIIFall18wmLHEGS, step=GEN-SIM, LHE \
(2) RunIIAutumn18DRPremix, step=DIGI,DATAMIX,L1,DIGI2RAW,HLT@relval2018 (PRIMIXRAW) \
(3) RunIIAutumn18DRPremix, step=RAW2DIGI,L1Reco,RECO,RECOSIM,EI (AODSIM) \
(4) RunIIAutumn18MiniAOD, step=PAT (MINIAODSIM)


https://www.evernote.com/l/Atr7L1llO45DUYZkiL-3083vTo453vYIjY4/
