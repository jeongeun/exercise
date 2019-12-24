#include "tdrstyle.C"
#include "CMS_lumi.C"
#include "TMath.h"
double GetPvalue(double nbkg, int nsigNbkg);
double GetExclusion(double nsigNbkg, int nbkg);

// --Function for calculating p-value
double GetPvalue(double nbkg, int nsigNbkg){

  double integral = 1.; 
  for(int i = 0; i < nsigNbkg; i++){
    integral -= TMath::Poisson(i,nbkg);
  }
  return integral;
} 
// --Fuction for caculating Exclusion rate
double GetExclusion(double nsigNbkg, int nbkg){

	double integral =0;
	for(int i=0; i< nbkg; i++){
		integral += TMath::Poisson(i,nsigNbkg);
	}
	return integral;
}

void pValueWp_0909() {

	const std::vector<double> masses  = {1, 2, 3, 4, 5, 6 } ;
        const std::vector<double> sig     = {12.5892, 7.61588,  3.16052, 0.730253,  0.353629, 0.177501 } ; 
        const std::vector<double> sig3    = {18.0138, 12.3011,  5.45779, 1.26401 ,  0.612486, 0.307428 } ; 

	//const std::vector<double> N_exp_S = {255.081, 14.9414, 1.29472, 0.0196151, 0.0132925, 0.00133155  } ; 
	//const std::vector<double> N_exp_B = {110.379, 1.13521, 0.0105337, 6.17e-05, 2.82e-08, 4.78e-11    } ; 
	//3ab-1 14 TeV
	//const std::vector<double> N_exp_S = {31.3307, 5.73134, 1.07782, 0.206507, 0.0359021 ,0.00713075  } ; 
	//const std::vector<double> N_exp_B = {507.444, 364.11, 257.732 , 183.48  , 153.483   ,153.483  } ; 
	const std::vector<double> N_exp_S = {28.4288   ,4.63843   ,0.862452   ,0.137805   , 0.0271771  , 0.00577292 } ; 
	const std::vector<double> N_exp_B = {457.772   ,306.449   ,183.48     ,128.983    , 50.9611    , 50.9611 } ; 
	// old const std::vector<double> N_exp_S = {259.634, 14.907, 1.30912, 0.136977,   0.0142451, 0.0014   } ; 
	// old const std::vector<double> N_exp_B = {134.386, 0.8555, 0.01164, 0.00923987, 0.00853975, 0.000000028} ; 

	const int nM = masses.size(); cout << "nM = " << nM << endl;
	const double minMass = masses[0] - 0.001;
	const double maxMass = masses[nM-1] + 0.001;

	//std::vector<double> L0p3_pvalue(nM, 0.);
	//std::vector<double> L0p3_significance(nM, 0.);
	//std::vector<double> L0p3_exclusion(nM, 0.);

	std::vector<double> L1_pvalue(nM, 0.);
	std::vector<double> L1_significance(nM, 0.);
	std::vector<double> L1_exclusion(nM, 0.);

	std::vector<double> L3_pvalue(nM, 0.);
	std::vector<double> L3_significance(nM, 0.);
	std::vector<double> L3_exclusion(nM, 0.);


	//TGraph* gr_L1_pvalue       = new TGraph(0);
	TGraph* gr_L1_significance = new TGraph(0);
	//TGraph* gr_L1_exclusion     = new TGraph(0);

	//TGraph* gr_L3_pvalue       = new TGraph(0);
	TGraph* gr_L3_significance = new TGraph(0);
	//TGraph* gr_L3_exclusion     = new TGraph(0);


	for(auto iwpM = 0; iwpM < nM; ++iwpM){ 

		L1_significance[iwpM] = sig[iwpM] ;
		L3_significance[iwpM] = sig3[iwpM] ;
		double L3_N_exp_B = N_exp_B[iwpM] * 50/3;
                double L3_N_exp_S = N_exp_S[iwpM] * 50/3;

		//double N_exp3_B = N_exp_B[iwpM] * 3;
                //double N_exp3_S = N_exp_S[iwpM] * 3;

		L1_pvalue[iwpM]       = GetPvalue(N_exp_B[iwpM], N_exp_B[iwpM] + N_exp_S[iwpM]);
		L1_significance[iwpM] = ROOT::Math::gaussian_quantile_c(L1_pvalue[iwpM],1);
		L1_exclusion[iwpM]    = GetExclusion(N_exp_B[iwpM] + N_exp_S[iwpM],N_exp_B[iwpM]);

		//L1_pvalue[iwpM]       = GetPvalue(N_exp3_B, N_exp3_B + N_exp3_S);
		//L1_significance[iwpM] = ROOT::Math::gaussian_quantile_c(L1_pvalue[iwpM],1);
		//L1_exclusion[iwpM]    = GetExclusion(N_exp3_B + N_exp3_S,N_exp3_B);

		// 30ab-1
		L3_pvalue[iwpM]       = GetPvalue(L3_N_exp_B, L3_N_exp_B + L3_N_exp_S);
		L3_significance[iwpM] = ROOT::Math::gaussian_quantile_c(L3_pvalue[iwpM],1);
		L3_exclusion[iwpM]    = GetExclusion(L3_N_exp_B + L3_N_exp_S,L3_N_exp_B);

		//gr_L1_pvalue->SetPoint(iwpM, masses[iwpM], L1_pvalue[iwpM]);		
		gr_L1_significance->SetPoint(iwpM, masses[iwpM], L1_significance[iwpM]);
		//gr_L1_exclusion->SetPoint(iwpM, masses[iwpM], L1_exclusion[iwpM]);

		//gr_L3_pvalue->SetPoint(iwpM, masses[iwpM], L3_pvalue[iwpM]);		
		gr_L3_significance->SetPoint(iwpM, masses[iwpM], L3_significance[iwpM]);
		//gr_L3_exclusion->SetPoint(iwpM, masses[iwpM], L3_exclusion[iwpM]);

		//cout << "L=3 ab ,M=" << masses[iwpM] << " p=" << setw(13) << L1_pvalue[iwpM] << " sig=" << setw(10) << L1_significance[iwpM] << " exclu=" << L1_exclusion[iwpM] << endl;
		cout << "L=50ab ,M=" << masses[iwpM] << " p=" << setw(13) << L3_pvalue[iwpM] << " sig=" << setw(10) << L3_significance[iwpM] << " exclu=" << L3_exclusion[iwpM] << endl;

		//L3_N_exp_B = 0.0;
                //L3_N_exp_S = 0.0;

	}

	//gr_L1_pvalue->SetLineColor(kBlack);       
	//gr_L1_pvalue->SetLineStyle(1);       
	gr_L3_significance->SetLineColor(kViolet);  
	gr_L3_significance->SetLineWidth(3);  
	gr_L3_significance->SetMarkerStyle(20);
	gr_L3_significance->SetMarkerColor(kViolet);
	//gr_L1_exclusion->SetLineColor(kGreen);      
	//gr_L1_exclusion->SetLineStyle(3);      
	                   
	//gr_L3_pvalue->SetLineColor(kPink);        
	//gr_L3_pvalue->SetLineStyle(1);        
	gr_L1_significance->SetLineColor(kGreen);  
	gr_L1_significance->SetLineWidth(3);  
	gr_L1_significance->SetLineStyle(1);  
	gr_L1_significance->SetMarkerStyle(21);  
	gr_L1_significance->SetMarkerColor(kGreen);  
	//gr_L3_exclusion->SetLineColor(kViolet);      
	//gr_L3_exclusion->SetLineStyle(3);      

        double maxY = 30;
	double minY = 0.001 ; //e-16;
 
	TH2D* massframe = new TH2D("massframe", "", 2, minMass , maxMass , 2, minY, maxY);
	TString ytitle = "Expected Significance #sigma";
        massframe->GetYaxis()->SetTitle(ytitle);
        massframe->GetYaxis()->SetTitleOffset(1.15);
        massframe->GetXaxis()->SetTitle("M_{W'} (TeV)");
        massframe->GetXaxis()->SetLabelSize(0.04);
        massframe->GetYaxis()->SetLabelSize(0.04);
        massframe->GetXaxis()->SetTitleSize(0.05);
        massframe->GetYaxis()->SetTitleSize(0.05);
        massframe->SetStats(kFALSE);

        writeExtraText = false;
        extraText = "Simulation Preliminary";
        drawLogo = false;
	setTDRStyle();
	lumiTextSize = 0.5;
	cmsTextSize = 0.6;

        int W = 1200;
        int H = 1200;
        int H_ref = 1200;
        int W_ref = 1200;
        float T = 0.08*H_ref;
        float B = 0.12*H_ref;
        float L = 0.12*W_ref;
        float R = 0.04*W_ref;

	TCanvas* c = new TCanvas("c","",800,800);
	c->SetFillColor(0);
        c->SetLeftMargin(L/W);
        c->SetRightMargin(R/W);
        c->SetTopMargin(T/H);
        c->SetBottomMargin(B/H);
        massframe->GetXaxis()->SetMoreLogLabels();
        massframe->GetXaxis()->SetNoExponent(kTRUE);
        massframe->Draw();


//	gr_L1_pvalue->Draw("pcsame");
	gr_L1_significance->Draw("cpsame");
//	gr_L1_exclusion->Draw("same");
//	gr_L3_pvalue->Draw("same");
	gr_L3_significance->Draw("cpsame");
//	gr_L3_exclusion->Draw("same");


        TLegend* legend = new TLegend(.60,.68,.80,.84,"");
        legend->SetTextSize(0.050);
        legend->SetTextFont(42);
        legend->SetBorderSize(0);
//	legend->AddEntry(gr_L1_pvalue       ,"L1_pvalue      " , "L"); 
	legend->AddEntry(gr_L3_significance ,"Lumi = 30 ab^{-1}" , "LP"); 
	legend->AddEntry(gr_L1_significance ,"Lumi = 3 ab^{-1}" , "LP"); 
//	legend->AddEntry(gr_L1_exclusion    ,"L1_exclusion   " , "L"); 
//	legend->AddEntry(gr_L3_pvalue       ,"L3_pvalue      " , "L"); 
//	legend->AddEntry(gr_L3_exclusion    ,"L3_exclusion   " , "L"); 
        legend->Draw(); 



	// --Exclution Limit 95%
	//TLine *l1 = new TLine(1,0.05,6,0.05);
	//l1->SetLineStyle(7);
	//l1->SetLineWidth(4);
	//l1->SetLineColor(2);
	TLine *l1 = new TLine(1,3,6,3);
	l1->SetLineStyle(7);
	l1->SetLineWidth(1);
	l1->SetLineColor(kBlue);
	l1->Draw("same"); 			// Line 5 sigmma

	// --Significance 5 sigma
	//TLine *l2 = new TLine(1,0.00151684,6,0.00151684);
	//l2->SetLineStyle(7);
	//l2->SetLineWidth(4);
	//l2->SetLineColor(2);
	TLine *l2 = new TLine(1,5,6,5);
	l2->SetLineStyle(7);
	l2->SetLineWidth(1);
	l2->SetLineColor(kRed);
	l2->Draw("same"); 			// Line 5 sigmma

        CMS_lumi(c,14,11);
        c->Update();
        c->RedrawAxis();
        c->GetFrame()->Draw();  c->RedrawAxis();
        c->GetFrame()->Draw();
        c->SetLogy();


}
