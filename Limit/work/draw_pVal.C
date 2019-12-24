#include "tdrstyle.C"
#include "CMS_lumi.C"
#include "TMath.h"

void draw_pVal() {

	const std::vector<double> lumi  = {1, 2, 3, 4, 5, 6 ,7,8,9,10,15,20,25,30,35,40,45,50} ;
        const std::vector<double> pVal1TeV = {0.233379 ,  0.147359 ,   0.098366,  0.0674558 ,  0.0470245 , 0.0331508 ,0.0235625 ,0.0168531 ,0.0121144 ,0.00874352,0.00633197, 0.00167176,0.000356891,7.80896e-05,1.63026e-05,3.66963e-06, 8.33138e-07,1.78929e-07, 4.11274e-08} ; 
        const std::vector<double> pVal2TeV = {0.479606 ,   0.43434 ,   0.405007,   0.401207 ,    0.38001 ,  0.361905 , 0.359823 ,  0.34447 , 0.330602 ,  0.329119,  0.316751,   0.283856,   0.256258,   0.227038,   0.207794,   0.186372,     0.17183,   0.155248,    0.143807} ; 
        const std::vector<double> significance1TeV  = { 0.727763 ,  1.04783 ,    1.29092,    1.49501 , 1.67442 , 1.83638 , 1.98517 , 2.12357 ,  2.25348 ,   2.3763,  2.49308,  2.93425,  3.38423,  3.78103,  4.15446,   4.4836,   4.79019, 5.09011,  5.36211 } ; 
        const std::vector<double> significance2TeV  = {0.0511429 , 0.165336 ,   0.240407,   0.250223 ,0.305455 , 0.35337 ,0.358931 ,0.400294 , 0.438252 , 0.442348, 0.476805, 0.571423, 0.654927, 0.748639, 0.814099, 0.891346,  0.946957, 1.01418,  1.06337 } ; 


	const int nL = lumi.size(); cout << "nL = " << nL << endl;
	const double minLumi = lumi[0] - 0.001;
	const double maxLumi = lumi[nL-1] + 0.001;

	std::vector<double> M1_pvalue(nL, 0.);
	std::vector<double> M1_significance(nL, 0.);

	std::vector<double> M2_pvalue(nL, 0.);
	std::vector<double> M2_significance(nL, 0.);


	TGraph* gr_M1_pvalue       = new TGraph(0);
	TGraph* gr_M1_significance = new TGraph(0);

        TGraph* gr_M2_pvalue       = new TGraph(0);
	TGraph* gr_M2_significance = new TGraph(0);


	for(auto iL = 0; iL < nL; ++iL){ 

		M1_pvalue[iL] = pVal1TeV[iL] ;
		M2_pvalue[iL] = pVal2TeV[iL] ;
		M1_significance[iL] = significance1TeV[iL] ;
		M2_significance[iL] = significance2TeV[iL] ;

		gr_M1_pvalue->SetPoint(iL, lumi[iL], M1_pvalue[iL]);
		gr_M2_pvalue->SetPoint(iL, lumi[iL], M2_pvalue[iL]);
		gr_M1_significance->SetPoint(iL, lumi[iL], M1_significance[iL]);
		gr_M2_significance->SetPoint(iL, lumi[iL], M2_significance[iL]);

		//cout << "L=50ab ,M=" << lumi[iwpM] << " p=" << setw(13) << L3_pvalue[iwpM] << " sig=" << setw(10) << L3_significance[iwpM] << " exclu=" << L3_exclusion[iwpM] << endl;
	}

	gr_M2_pvalue->SetLineColor(kBlack);  
	gr_M2_pvalue->SetLineWidth(3);  
	gr_M2_pvalue->SetMarkerStyle(20);
	gr_M2_pvalue->SetMarkerColor(kBlack);
	gr_M1_pvalue->SetLineColor(kRed);  
	gr_M1_pvalue->SetLineWidth(3);  
	gr_M1_pvalue->SetLineStyle(1);  
	gr_M1_pvalue->SetMarkerStyle(21);  
	gr_M1_pvalue->SetMarkerColor(kRed);  

	gr_M2_significance->SetLineColor(kViolet);  
	gr_M2_significance->SetLineWidth(3);  
	gr_M2_significance->SetMarkerStyle(20);
	gr_M2_significance->SetMarkerColor(kViolet);
	gr_M1_significance->SetLineColor(kGreen);  
	gr_M1_significance->SetLineWidth(3);  
	gr_M1_significance->SetLineStyle(1);  
	gr_M1_significance->SetMarkerStyle(21);  
	gr_M1_significance->SetMarkerColor(kGreen);  

        double maxY = 500;
	double minY = 0.000000001 ; //e-16;
 
	TH2D* massframe = new TH2D("massframe", "", 2, minLumi , maxLumi , 2, minY, maxY);
	TString ytitle = "Expected Significance #sigma, p-value";
        massframe->GetYaxis()->SetTitle(ytitle);
        massframe->GetYaxis()->SetTitleOffset(1.15);
        massframe->GetXaxis()->SetTitle("Luminosity (ab^{-1})");
        massframe->GetXaxis()->SetLabelSize(0.04);
        massframe->GetYaxis()->SetLabelSize(0.04);
        massframe->GetXaxis()->SetTitleSize(0.05);
        massframe->GetYaxis()->SetTitleSize(0.05);
        massframe->SetStats(kFALSE);

        writeExtraText = false;
        extraText = "Simulation";
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

	gr_M1_significance->Draw("csame");
	gr_M2_significance->Draw("csame");
	gr_M1_pvalue->Draw("csame");
	gr_M2_pvalue->Draw("csame");


        TLegend* legend = new TLegend(.40,.20,.80,.34,"");
        legend->SetTextSize(0.030);
        legend->SetTextFont(42);
        legend->SetBorderSize(0);
	legend->AddEntry(gr_M1_significance ,"sig M(W')=1 TeV" , "LP"); 
	legend->AddEntry(gr_M2_significance ,"sig M(W')=2 TeV" , "LP"); 
	legend->AddEntry(gr_M1_pvalue ,"p-val M(W')=1 TeV" , "LP"); 
	legend->AddEntry(gr_M2_pvalue ,"p-val M(W')=2 TeV" , "LP"); 
        legend->Draw(); 



	TLine *l1 = new TLine(1,3,50,3);
	l1->SetLineStyle(7);
	l1->SetLineWidth(1);
	l1->SetLineColor(kBlue);
	l1->Draw("same"); 			// Line 5 sigmma

	TLine *l2 = new TLine(1,5,50,5);
	l2->SetLineStyle(7);
	l2->SetLineWidth(1);
	l2->SetLineColor(kRed);
	l2->Draw("same"); 			// Line 5 sigmma

	TLine *l3 = new TLine(1,2.9e-07,50,2.9e-07);
	l3->SetLineStyle(7);
	l3->SetLineWidth(1);
	l3->SetLineColor(kGreen);
	l3->Draw("same"); 			// Line 5 sigmma

        CMS_lumi(c,14,11);
        c->Update();
        c->RedrawAxis();
        c->GetFrame()->Draw();  c->RedrawAxis();
        c->GetFrame()->Draw();
        c->SetLogy();


}
