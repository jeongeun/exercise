void optimize(){

double Lumi = 1000000.0;
long double xsecSignal1=7.86413203891e-03;//1TeV Signal
long double xsecSignal2=6.02158250669e-04;//2TeV Signal
long double xsecSignal3=8.0034493626e-05;//3TeV Signal
long double xsecSignal4=1.21682024511e-05;//4TeV Signal
long double xsecSignal5=1.89757563679e-06;//5TeV Signal
long double xsecSignal6=2.88776020804e-07;//6TeV Signal

long double xsecw2j100to500  =22.4645492;
long double xsecw2j500to1000 =0.220401086;
long double xsecw2j1000to2000=0.00847007776;
long double xsecw2j2000to3000=6.160953643e-05;
long double xsecw2j3000to4000=6.5935273893e-07;
long double xsecw2j4000to5000=5.62906155243e-09;
long double xsecw2j5000to6000=2.39018329425e-11;
long double xsecw2j6000toinf =7.29251198043e-15;

int NSignal       =1000000;
int Nw2j100to500  =1000000;
int Nw2j500to1000 =1000000;
int Nw2j1000to2000=1000000;
int Nw2j2000to3000=1000000;
int Nw2j3000to4000=1000000;
int Nw2j4000to5000=1000000;
int Nw2j5000to6000=1000000;
int Nw2j6000toinf =1000000;

TFile* fSignal1       = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/signal_1000mass_cut.root");
TFile* fSignal2       = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/signal_2000mass_cut.root");
TFile* fSignal3       = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/signal_3000mass_cut.root");
TFile* fSignal4       = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/signal_4000mass_cut.root");
TFile* fSignal5       = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/signal_5000mass_cut.root");
TFile* fSignal6       = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/signal_6000mass_cut.root");
TFile* fw2j100to500   = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/wjets_500Mjj_4mom100to500_cut.root");
TFile* fw2j500to1000  = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/wjets_500Mjj_4mom500to1000_cut.root");
TFile* fw2j1000to2000 = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/wjets_500Mjj_4mom1000to2000_cut.root");
TFile* fw2j2000to3000 = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/wjets_500Mjj_4mom2000to3000_cut.root");
TFile* fw2j3000to4000 = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/wjets_500Mjj_4mom3000to4000_cut.root");
TFile* fw2j4000to5000 = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/wjets_500Mjj_4mom4000to5000_cut.root");
TFile* fw2j5000to6000 = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/wjets_500Mjj_4mom5000to6000_cut.root");
TFile* fw2j6000toinf  = TFile::Open("/home/taebh/workspace/MG5_aMC_v2_6_4/VBFWprime/gridpack/Signifi/wjets_500Mjj_4mom6000toinf_cut.root");
TString histname = "Mt_ev";
TH1F* hSignal1       = (TH1F*)fSignal1      ->Get(histname); hSignal1      ->Scale(xsecSignal1/NSignal*Lumi);
TH1F* hSignal2       = (TH1F*)fSignal2      ->Get(histname); hSignal2      ->Scale(xsecSignal2/NSignal*Lumi);
TH1F* hSignal3       = (TH1F*)fSignal3      ->Get(histname); hSignal3      ->Scale(xsecSignal3/NSignal*Lumi);
TH1F* hSignal4       = (TH1F*)fSignal4      ->Get(histname); hSignal4      ->Scale(xsecSignal4/NSignal*Lumi);
TH1F* hSignal5       = (TH1F*)fSignal5      ->Get(histname); hSignal5      ->Scale(xsecSignal5/NSignal*Lumi);
TH1F* hSignal6       = (TH1F*)fSignal6      ->Get(histname); hSignal6      ->Scale(xsecSignal6/NSignal*Lumi);

TH1F* hw2j100to500   = (TH1F*)fw2j100to500  ->Get(histname); hw2j100to500  ->Scale(xsecw2j100to500/Nw2j100to500*Lumi);
TH1F* hw2j500to1000  = (TH1F*)fw2j500to1000 ->Get(histname); hw2j500to1000 ->Scale(xsecw2j500to1000/Nw2j500to1000*Lumi);
TH1F* hw2j1000to2000 = (TH1F*)fw2j1000to2000->Get(histname); hw2j1000to2000->Scale(xsecw2j1000to2000/Nw2j1000to2000*Lumi);
TH1F* hw2j2000to3000 = (TH1F*)fw2j2000to3000->Get(histname); hw2j2000to3000->Scale(xsecw2j2000to3000/Nw2j2000to3000*Lumi);
TH1F* hw2j3000to4000 = (TH1F*)fw2j3000to4000->Get(histname); hw2j3000to4000->Scale(xsecw2j3000to4000/Nw2j3000to4000*Lumi);
TH1F* hw2j4000to5000 = (TH1F*)fw2j4000to5000->Get(histname); hw2j4000to5000->Scale(xsecw2j4000to5000/Nw2j4000to5000*Lumi);
TH1F* hw2j5000to6000 = (TH1F*)fw2j5000to6000->Get(histname); hw2j5000to6000->Scale(xsecw2j5000to6000/Nw2j5000to6000*Lumi);
TH1F* hw2j6000toinf  = (TH1F*)fw2j6000toinf ->Get(histname); hw2j6000toinf ->Scale(xsecw2j6000toinf/Nw2j6000toinf*Lumi);

long double Ns1, Ns2, Ns3, Ns4, Ns5, Ns6;
//Ns1=0; Ns2=0; Ns3=0; Ns4=0; Ns5=0; Ns6=0;
long double Nbg=0;
long double significance;
double xmax[]={0,0,0,0,0,0};
double ymax[]={0,0,0,0,0,0};
double Nsmax[]={0,0,0,0,0,0};
double Nbgmax[]={0,0,0,0,0,0};

for(int i=3000; i<=5000; i+=20){
        Nbg=hw2j100to500   ->Integral(i,1000000);
        Nbg+=hw2j500to1000 ->Integral(i,1000000);
        Nbg+=hw2j1000to2000->Integral(i,1000000);
        Nbg+=hw2j2000to3000->Integral(i,1000000);
        Nbg+=hw2j3000to4000->Integral(i,1000000);
        Nbg+=hw2j4000to5000->Integral(i,1000000);
        Nbg+=hw2j5000to6000->Integral(i,1000000);
        Nbg+=hw2j6000toinf ->Integral(i,1000000);

        if(Nbg==0.0)continue;

        Ns1=hSignal1->Integral(i,1000000);
        significance=Ns1/sqrt(Nbg); 
        if(ymax[0]<significance){xmax[0]=i;ymax[0]=significance;Nsmax[0]=Ns1;Nbgmax[0]=Nbg;}

        Ns2=hSignal2->Integral(i,1000000);
        significance=Ns2/sqrt(Nbg);
        if(ymax[1]<significance){xmax[1]=i;ymax[1]=significance;Nsmax[1]=Ns2;Nbgmax[1]=Nbg;}


        Ns3=hSignal3->Integral(i,1000000);
        significance=Ns3/sqrt(Nbg);
        if(ymax[2]<significance){xmax[2]=i;ymax[2]=significance;Nsmax[2]=Ns3;Nbgmax[2]=Nbg;}

        Ns4=hSignal4->Integral(i,1000000);
        significance=Ns4/sqrt(Nbg);
        if(ymax[3]<significance){xmax[3]=i;ymax[3]=significance;Nsmax[3]=Ns4;Nbgmax[3]=Nbg;}
	cout << "Mtcut " << i << " Ns= " << Ns4 << " Nb= " << Nbg << " sig " << significance << endl;


        Ns5=hSignal5->Integral(i,1000000);
        significance=Ns5/sqrt(Nbg);
        if(ymax[4]<significance){xmax[4]=i;ymax[4]=significance;Nsmax[4]=Ns5;Nbgmax[4]=Nbg;}

        Ns6=hSignal6->Integral(i,1000000);
        significance=Ns6/sqrt(Nbg);
        if(ymax[5]<significance){xmax[5]=i;ymax[5]=significance;Nsmax[5]=Ns6;Nbgmax[5]=Nbg;}

}

for(int j=0; j<6; j++){

        cout << "Maximum Mt cut " << j+1 << "000TeV : " << xmax[j] << endl;
        cout << " Maximum Significance " << j+1 << "000TeV : " << ymax[j] <<endl;
        cout << " Maximum signal Yield " << j+1 << "000TeV : " << Nsmax[j] <<endl;
        cout << " Maximum Background Yield " << j+1 << "000TeV : " << Nbgmax[j] << endl;

}

}
