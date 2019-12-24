#include "tdrstyle.C"
#include "CMS_lumi.C"

void DrawLimit(const TString& channel, const std::vector<double>& masses, const std::vector<double>& expected_limit_2p5, const std::vector<double>& expected_limit_16, const std::vector<double>& expected_limit_50, const std::vector<double>& expected_limit_84, const std::vector<double>& expected_limit_97p5);

void DrawLimitsWp_1019()
{
	const std::vector<double> wpev_expected_limit_2p5 =  { 2.5942, 17.9238, 80.6748 , 249.9180, 751.1875 } ; // ,  380.4609  }; 
	const std::vector<double> wpev_expected_limit_16 =   { 3.4434, 23.7909, 108.0479, 334.7156, 1010.0986} ; // ,  524.5964  }; 
	const std::vector<double> wpev_expected_limit_50 =   { 4.8125, 33.2500, 150.7500, 467.0000, 1414.0000} ; // ,  773.0000  }; 
	const std::vector<double> wpev_expected_limit_84 =   { 6.7691, 46.7687, 212.6423, 658.7327, 2005.8077} ; // ,  1167.3950 };
	const std::vector<double> wpev_expected_limit_97p5 = { 9.1348, 63.5376, 287.5243, 893.6793, 2731.6309} ; // ,  1708.1476 }; 
	const std::vector<double> masses = {1000, 2000, 3000, 4000, 5000}; //, 6000};

	DrawLimit("wpev", masses, wpev_expected_limit_2p5, wpev_expected_limit_16, wpev_expected_limit_50, wpev_expected_limit_84, wpev_expected_limit_97p5);
}

void DrawLimit(const TString& channel, const std::vector<double>& masses, const std::vector<double>& expected_limit_2p5, const std::vector<double>& expected_limit_16, const std::vector<double>& expected_limit_50, const std::vector<double>& expected_limit_84, const std::vector<double>& expected_limit_97p5)
{
	const int nMasses = masses.size();
	const double lumi = 35.9;

	const double minMass = masses[0] - 0.001;
	const double maxMass = masses[nMasses-1] + 0.001;

	std::vector<double> p2s(nMasses, 0.);
	std::vector<double> p1s(nMasses, 0.);
	std::vector<double> m1s(nMasses, 0.);
	std::vector<double> m2s(nMasses, 0.);

	for(auto idx = 0; idx < nMasses; ++idx)
	{
		p2s[idx] = (expected_limit_97p5[idx] - expected_limit_50[idx]);
		p1s[idx] = (expected_limit_84[idx] - expected_limit_50[idx]);
		m1s[idx] = (expected_limit_50[idx] - expected_limit_16[idx]);
		m2s[idx] = (expected_limit_50[idx] - expected_limit_2p5[idx]);
	}
	const std::vector<double> xsecs = { 7.864, 6.022e-01, 8.003e-02, 1.217e-02, 1.900e-03 }; //, 2.888e-4  }; //(fb)	
	const std::vector<double> theory_masses = {1000, 2000, 3000, 4000, 5000}; //, 6000};


	TGraph* expected = new TGraph(0);
	TGraphAsymmErrors* pm2s = new TGraphAsymmErrors(0);
	TGraphAsymmErrors* pm1s = new TGraphAsymmErrors(0);

	for(auto idx = 0; idx < nMasses; ++idx)
	{
		expected->SetPoint(idx, masses[idx], expected_limit_50[idx] *0.01*xsecs[idx]);
		pm2s->SetPoint(idx, masses[idx], expected_limit_50[idx]     *0.01*xsecs[idx]);
		pm1s->SetPoint(idx, masses[idx], expected_limit_50[idx]     *0.01*xsecs[idx]);
		pm2s->SetPointError(idx, 0., 0., m2s[idx]*0.01 *xsecs[idx], p2s[idx]*0.01*xsecs[idx]);
		pm1s->SetPointError(idx, 0., 0., m1s[idx]*0.01 *xsecs[idx], p1s[idx]*0.01*xsecs[idx]);
	}

	TGraph* theory = new TGraph(0);
	for (auto idx = 0; idx < theory_masses.size(); ++idx) theory->SetPoint(idx, theory_masses[idx], xsecs[idx] ); //* 1e12);

	expected->SetLineColor(1);
	expected->SetLineStyle(kDashed);
	expected->SetLineWidth(2);

	pm2s->SetLineWidth(0);
	pm2s->SetFillColor(kOrange);

	pm1s->SetLineWidth(0);
	pm1s->SetFillColor(kGreen+1);

	theory->SetLineColor(2);
	theory->SetLineWidth(2);
	theory->SetLineStyle(5);

	double maxLimit = 3.0e+01;
	double minLimit = 1.0e-03;

	TH2D* massframe = new TH2D("massframe", "", 2, minMass, maxMass, 2, minLimit, maxLimit);

	TString type = "";
	if (channel == "wpev") type = "W'";
	massframe->GetXaxis()->SetTitle("#it{M}_{" + type + "} (GeV)");
	massframe->GetXaxis()->SetTitleOffset(1.1);
	
	TString ytitle = "#sigma #times ";
	//if (channel == "wpev") ytitle += "#bf{#it{#Beta}}(W'#rightarrow#it{e#nu}) (fb)";
	if (channel == "wpev") ytitle += "#it{B}(W'#rightarrow#it{e#nu}) (fb)";

	massframe->GetYaxis()->SetTitle(ytitle);
	massframe->GetYaxis()->SetTitleOffset(1.15);
        massframe->GetXaxis()->SetLabelSize(0.04);
        massframe->GetYaxis()->SetLabelSize(0.04);
        massframe->GetXaxis()->SetTitleSize(0.05);
        massframe->GetYaxis()->SetTitleSize(0.05);
	massframe->SetStats(kFALSE);

        writeExtraText = true;
        extraText = "VBF W'#rightarrow#it{e#nujj}";
        drawLogo = false;
        //drawLogo = true;
        setTDRStyle();

        lumiTextSize = 0.5;
        cmsTextSize = 0.5;

	int W = 1200;
	int H = 1200;
	int H_ref = 1200;
	int W_ref = 1200;

	// references for T, B, L, R
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


	pm2s->Draw("E3SAME");
	pm1s->Draw("E3SAME");
	expected->Draw("SAME");
	theory->Draw("CSAME");
	massframe->Draw("AXISSAME");

	//TLegend* legend = new TLegend(.57,.6,.80,.89,"95% CL Upper Limits");
	//TLegend* legend = new TLegend(.55,.35,.90,.620,"95% CL Upper Limits");
	TLegend* legend = new TLegend(.15,.15,.45,.450,"95% CL Upper Limits");
	legend->SetTextSize(0.030);
	// legend->SetTextSize(0.06);
	    legend->SetTextFont(42);
	legend->AddEntry(theory, "#sigma_{theo} HVT model W' #rightarrow e#nu", "L");
	legend->AddEntry(expected,"Median Expected Limit","L");
	legend->AddEntry(pm1s,"Expected #pm 1 #sigma","F");//68% 
	legend->AddEntry(pm2s,"Expected #pm 2 #sigma","F");//95% 
	legend->SetBorderSize(0);
	legend->Draw();

	// CMS_lumi(c,4,11);
	CMS_lumi(c,13,11);
	c->Update();
	c->RedrawAxis();
	c->GetFrame()->Draw();	c->RedrawAxis();
	c->GetFrame()->Draw();
	c->SetLogy();
    //c->Print("limits/"+channel+".pdf");


}
