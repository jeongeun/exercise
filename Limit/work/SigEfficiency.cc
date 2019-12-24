#include "tdrstyle.C"
#include "CMS_lumi.C"

void DrawSignalEff(const std::vector<double>& masses, const std::vector<double>& vbf_effs, const std::vector<double>& kin_effs);

void SigEfficiency()
{
	const std::vector<double> masses = {1000, 2000, 3000, 4000, 5000, 6000};
	const std::vector<double> vbf_effs = {4.016E-02, 2.711E-02, 1.729E-02, 1.159E-02, 7.616E-03, 4.945E-03 };
	const std::vector<double> kin_effs = {1.370E-02, 9.613E-03, 6.261E-03, 4.256E-03, 2.871E-03, 1.840E-03 };

	DrawSignalEff(masses, vbf_effs, kin_effs );
}

void DrawSignalEff(const std::vector<double>& masses, const std::vector<double>& vbf_effs, const std::vector<double>& kin_effs)
{
	const int nMasses = masses.size();  cout << "nM = " << nMasses << endl;
	//const double lumi = 35.9;

	const double minMass = masses[0] - 0.1;
	const double maxMass = masses[nMasses-1] + 0.1;

	//std::vector<double> vbf_effs(nMasses, 0.);
	//std::vector<double> kin_effs(nMasses, 0.);

	TGraph* gr_vbf_effs = new TGraph(0);
	TGraph* gr_kin_effs = new TGraph(0);
	for(auto idx = 0; idx < nMasses; ++idx)
	{
		gr_vbf_effs->SetPoint(idx, masses[idx], vbf_effs[idx]);
		gr_kin_effs->SetPoint(idx, masses[idx], kin_effs[idx]);
		cout << "M = " << masses[idx] << " vbf eff = " << vbf_effs[idx] << " kin eff = " << kin_effs[idx] << endl;
	}

	gr_vbf_effs->SetLineColor(3);
	//vbf_eff->SetLineStyle(kDashed);
	gr_vbf_effs->SetLineWidth(3);

	//gr_vbf_effs->SetLineWidth(1);
	//gr_vbf_effs->SetFillColor(kBlue);
	gr_vbf_effs->SetMarkerSize(2);
	gr_vbf_effs->SetMarkerStyle(10);
	gr_vbf_effs->SetMarkerColor(3);

	//gr_kin_effs->SetLineWidth(1);
	//gr_kin_effs->SetFillColor(kOrange);
	gr_kin_effs->SetLineColor(4);
	gr_kin_effs->SetLineWidth(3);
	gr_kin_effs->SetMarkerSize(2);
	gr_kin_effs->SetMarkerColor(4);
	gr_kin_effs->SetMarkerStyle(10);

	//double maxLimit = 1.5;
	//double minLimit = 1e-2;

	TH2D* massframe = new TH2D("massframe", "", 2, minMass, maxMass, 2, 0.0001, 1.1);

	TString type = "";
	TString xtitle = "M(W') (GeV)";
	massframe->GetXaxis()->SetTitleOffset(1.1);
	

	TString ytitle = "Acceptance #times Efficiency";
	//TString ytitle = "#sigma #times ";
	//ytitle += "#bf{#it{#Beta}}(Acceptance #times Efficiency)";

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
	gr_vbf_effs->Draw("CSAME");
	gr_kin_effs->Draw("CSAME");
	//theory->Draw("CSAME");
	massframe->Draw("AXISSAME");

	TLegend* legend = new TLegend(.30,.18,.70,.39,"VBF W'#rightarrowe#nu, #sqrt{s} = 14 TeV");
	legend->SetTextSize(0.035);
	// legend->SetTextSize(0.06);
	    legend->SetTextFont(42);
	legend->AddEntry(gr_vbf_effs,"VBF selection: M_{jj} #Delta#eta(j,j)","PL");
	legend->AddEntry(gr_kin_effs,"Kinematic selection : E_{T}^{e}/E_{T}^{#nu} , #Delta#phi(e,#nu)","PL");
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
