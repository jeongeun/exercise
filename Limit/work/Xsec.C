#include "tdrstyle.C"
#include "CMS_lumi.C"

void DrawXsec(const std::vector<double>& masses, const std::vector<double>& vbf_xsec, const std::vector<double>& dy_xsec);

void Xsec()
{
	const std::vector<double> masses = {1000, 2000, 3000, 4000, 5000, 6000, 7000};
	const std::vector<double> vbf_xsec ={0.03292, 0.0003976, 2.093e-05, 1.669e-06, 1.543e-07, 1.45e-08 , 1.265e-09 };
	const std::vector<double> dy_xsec = {2.207  , 0.07543  , 0.007262 , 0.0009404, 0.0001325, 1.872e-05, 2.622e-06 };

	DrawXsec(masses, vbf_xsec, dy_xsec );
}

void DrawXsec(const std::vector<double>& masses, const std::vector<double>& vbf_xsec, const std::vector<double>& dy_xsec)
{
	const int nMasses = masses.size();  cout << "nM = " << nMasses << endl;
	const double minMass = masses[0] - 0.1;
	const double maxMass = masses[nMasses-1] + 0.1;
	//std::vector<double> vbf_xsec(nMasses, 0.);
	//std::vector<double> dy_xsec(nMasses, 0.);
	TGraph* gr_vbf_xsec = new TGraph(0);
	TGraph* gr_dy_xsec = new TGraph(0);
	for(auto idx = 0; idx < nMasses; ++idx)
	{
		gr_vbf_xsec->SetPoint(idx, masses[idx], vbf_xsec[idx]);
		gr_dy_xsec->SetPoint(idx, masses[idx], dy_xsec[idx]);
		cout << "M = " << masses[idx] << " vbf xsec = " << vbf_xsec[idx] << "[pb] kin eff = " << dy_xsec[idx] << "[pb]" << endl;
	}

	gr_vbf_xsec->SetLineColor(3);
	//vbf_eff->SetLineStyle(kDashed);
	gr_vbf_xsec->SetLineWidth(3);

	//gr_vbf_xsec->SetLineWidth(1);
	//gr_vbf_xsec->SetFillColor(kBlue);
	gr_vbf_xsec->SetMarkerSize(2);
	gr_vbf_xsec->SetMarkerStyle(10);
	gr_vbf_xsec->SetMarkerColor(3);

	//gr_dy_xsec->SetLineWidth(1);
	//gr_dy_xsec->SetFillColor(kOrange);
	gr_dy_xsec->SetLineColor(4);
	gr_dy_xsec->SetLineWidth(3);
	gr_dy_xsec->SetMarkerSize(2);
	gr_dy_xsec->SetMarkerColor(4);
	gr_dy_xsec->SetMarkerStyle(10);

	//double maxLimit = 1.5;
	//double minLimit = 1e-2;

	TH2D* massframe = new TH2D("massframe", "", 2, minMass, maxMass, 2, 1.0e-10, 10);

	TString type = "";
	TString xtitle = "M(W') (GeV)";
	massframe->GetXaxis()->SetTitleOffset(1.1);
	

	TString ytitle = "#sigma^{prod} [pb]";

	massframe->GetXaxis()->SetTitle(xtitle);
	massframe->GetYaxis()->SetTitle(ytitle);
	massframe->GetYaxis()->SetTitleOffset(1.15);
        massframe->GetXaxis()->SetLabelSize(0.04);
        massframe->GetYaxis()->SetLabelSize(0.04);
        massframe->GetXaxis()->SetTitleSize(0.05);
        massframe->GetYaxis()->SetTitleSize(0.05);
	massframe->SetStats(kFALSE);

        //writeExtraText = true;
        //extraText = "Simulation Preliminary";
        drawLogo = false;
        setTDRStyle();

        lumiTextSize = 0.5;
        cmsTextSize = 0.6;

	int W = 1200;
	int H = 1200;
	int H_ref = 1200;
	int W_ref = 1200;

	// references for T, B, L, R
	float T = 0.08*H_ref;
	float B = 0.12*H_ref;
	float L = 0.12*W_ref;
	float R = 0.04*W_ref;

        TCanvas* c = new TCanvas("c","",700,800);  
        c->SetFillColor(0);
	c->SetLeftMargin(L/W);
	c->SetRightMargin(R/W);
	c->SetTopMargin(T/H);
	c->SetBottomMargin(B/H);
	massframe->GetXaxis()->SetMoreLogLabels();
	massframe->GetXaxis()->SetNoExponent(kTRUE);
	massframe->Draw();


	//pm2s->Draw("E3SAME");
	//pm1s->Draw("E3SAME");
	gr_vbf_xsec->Draw("CSAME");
	gr_dy_xsec->Draw("CSAME");
	//theory->Draw("CSAME");
	massframe->Draw("AXISSAME");

	TLegend* legend = new TLegend(.30,.18,.70,.39,"HL-LHC, #sqrt{s} = 14 TeV");
	legend->SetTextSize(0.035);
	// legend->SetTextSize(0.06);
	    legend->SetTextFont(42);
	legend->AddEntry(gr_vbf_xsec,"VBF, pp #rightarrow W' + 2j (g_{V}=3)","PL");
	legend->AddEntry(gr_dy_xsec,"DY, pp #rightarrow W' (g_{V}=3)","PL");
	legend->SetBorderSize(0);
	legend->Draw();

	 CMS_lumi(c,14,11);
	//CMS_lumi(c,13,1);
	c->Update();
	c->RedrawAxis();
	c->GetFrame()->Draw();	c->RedrawAxis();
	c->GetFrame()->Draw();
	c->SetLogy();
    //c->Print("limits/"+channel+".pdf");
}
