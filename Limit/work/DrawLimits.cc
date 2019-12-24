#include "tdrstyle.C"
#include "CMS_lumi.C"

void DrawLimit(const TString& channel, const std::vector<double>& masses, const std::vector<double>& expected_limit_2p5, const std::vector<double>& expected_limit_16, const std::vector<double>& expected_limit_50, const std::vector<double>& expected_limit_84, const std::vector<double>& expected_limit_97p5);

void DrawLimits()
{
	const std::vector<double> eeg_expected_limit_2p5 = {108.5430, 63.2344, 62.9570, 63.0957, 64.0664, 63.0957, 64.2051, 64.0664, 63.0957, 62.6797, 63.5117, 63.6504, 62.5410, 64.2051};
	const std::vector<double> eeg_expected_limit_16 = {140.7208, 83.0647, 82.7004, 82.8825, 84.1577, 82.8825, 84.3398, 84.1577, 82.8825, 82.3361, 83.4290, 83.6112, 82.1539, 84.3398};
	const std::vector<double> eeg_expected_limit_50 = {187.7500, 114.0000, 113.5000, 113.7500, 115.5000, 113.7500, 115.7500, 115.5000, 113.7500, 113.0000, 114.5000, 114.7500, 112.7500, 115.7500};
	const std::vector<double> eeg_expected_limit_84 = {251.3623, 158.0777, 156.9319, 157.2776, 159.2369, 157.2776, 160.0429, 159.2369, 157.2776, 156.2406, 158.7710, 159.1176, 155.8949, 160.0429};
	const std::vector<double> eeg_expected_limit_97p5 = {325.0104, 210.3791, 209.8646, 211.0636, 213.9817, 211.0636, 213.2751, 213.9817, 211.0636, 208.9401, 211.3018, 211.7631, 208.4778, 213.2751};
	const std::vector<double> mmg_expected_limit_2p5 = {125.9766, 129.7930, 131.8301, 132.9941, 132.5576, 134.7402, 133.2852, 133.8672, 133.1396, 132.5576, 135.0312, 134.7402, 131.8301, 132.4121};
	const std::vector<double> mmg_expected_limit_16 = {162.1423, 167.6583, 170.2897, 171.7934, 171.2295, 174.0489, 172.1693, 172.9211, 171.9814, 171.2295, 174.4248, 174.0489, 170.2897, 171.0416};
	const std::vector<double> mmg_expected_limit_50 = {215.0000, 223.0000, 226.5000, 228.5000, 227.7500, 231.5000, 229.0000, 230.0000, 228.7500, 227.7500, 232.0000, 231.5000, 226.5000, 227.5000};
	const std::vector<double> mmg_expected_limit_84 = {286.1309, 296.7777, 301.4356, 304.0973, 303.0992, 308.0898, 304.7627, 306.0936, 304.4300, 303.0992, 308.7552, 308.0898, 301.4356, 302.7664};
	const std::vector<double> mmg_expected_limit_97p5 = {367.9911, 381.6838, 387.6743, 391.0975, 389.8138, 396.2323, 391.9533, 393.6649, 391.5254, 389.8138, 397.0881, 396.2323, 387.6743, 389.3859};
	const std::vector<double> masses = {1000, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 5250, 5500, 5750, 6000, 6250, 6500};

	DrawLimit("eeg", masses, eeg_expected_limit_2p5, eeg_expected_limit_16, eeg_expected_limit_50, eeg_expected_limit_84, eeg_expected_limit_97p5);
	DrawLimit("mmg", masses, mmg_expected_limit_2p5, mmg_expected_limit_16, mmg_expected_limit_50, mmg_expected_limit_84, mmg_expected_limit_97p5);
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

	TGraph* expected = new TGraph(0);
	TGraphAsymmErrors* pm2s = new TGraphAsymmErrors(0);
	TGraphAsymmErrors* pm1s = new TGraphAsymmErrors(0);

	for(auto idx = 0; idx < nMasses; ++idx)
	{
		expected->SetPoint(idx, masses[idx], expected_limit_50[idx] / 3000.);
		pm2s->SetPoint(idx, masses[idx], expected_limit_50[idx] / 3000.);
		pm1s->SetPoint(idx, masses[idx], expected_limit_50[idx] / 3000.);
		pm2s->SetPointError(idx, 0., 0., m2s[idx] / 3000., p2s[idx] / 3000.);
		pm1s->SetPointError(idx, 0., 0., m1s[idx] / 3000., p1s[idx] / 3000.);
	}

	const std::vector<double> xsecs = {4.330e-09, 3.945e-10, 5.921e-11, 1.155e-11, 2.692e-12, 7.030e-13, 2.003e-13, 6.219e-14, 2.036e-14, 7.226e-15, 2.762e-15, 1.153e-15};
	const std::vector<double> theory_masses = {1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000, 5500, 6000, 6500};

	TGraph* theory = new TGraph(0);
	for (auto idx = 0; idx < theory_masses.size(); ++idx) theory->SetPoint(idx, theory_masses[idx], xsecs[idx] * 1e12);

	expected->SetLineColor(1);
	expected->SetLineStyle(kDashed);
	expected->SetLineWidth(2);

	pm2s->SetLineWidth(0);
	pm2s->SetFillColor(kOrange);

	pm1s->SetLineWidth(0);
	pm1s->SetFillColor(kGreen+1);

	theory->SetLineWidth(2);
	theory->SetLineStyle(5);

	double maxLimit = 1.5;
	double minLimit = 1e-3;

	TH2D* massframe = new TH2D("massframe", "", 10, minMass, maxMass, 20, minLimit, maxLimit);

	TString type = "";
	if (channel == "eeg") type = "e*";
	if (channel == "mmg") type = "#it{#mu}*";
	massframe->GetXaxis()->SetTitle("#it{M}_{" + type + "} (GeV)");
	massframe->GetXaxis()->SetTitleOffset(1.1);
	
	TString ytitle = "#sigma #times ";
	if (channel == "eeg") ytitle += "#bf{#it{#Beta}}(e*#rightarrowe#it{#gamma}) (fb)";
	if (channel == "mmg") ytitle += "#bf{#it{#Beta}}(#it{#mu}*#rightarrow#it{#mu#gamma}) (fb)";

	massframe->GetYaxis()->SetTitle(ytitle);
	massframe->GetYaxis()->SetTitleOffset(1.15);
    massframe->GetXaxis()->SetLabelSize(0.04);
    massframe->GetYaxis()->SetLabelSize(0.04);
    massframe->GetXaxis()->SetTitleSize(0.05);
    massframe->GetYaxis()->SetTitleSize(0.05);
	massframe->SetStats(kFALSE);

    writeExtraText = true;
    extraText = "Simulation Preliminary";
    drawLogo = false;
    setTDRStyle();

    lumiTextSize = 0.;
    cmsTextSize = .6;

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
    c->SetLogy();
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

	TLegend* legend = new TLegend(.65,.6,.89,.89,"95% CL upper limits");
	legend->SetTextSize(0.025);
	// legend->SetTextSize(0.06);
    legend->SetTextFont(42);
	legend->AddEntry(expected,"Median expected","L");
	legend->AddEntry(pm1s,"68% expected","F");
	legend->AddEntry(pm2s,"95% expected","F");
	legend->AddEntry(theory, "Theory (#Lambda = #it{M}_{" + type + "})", "L");
	legend->SetBorderSize(0);
	legend->Draw();

	// CMS_lumi(c,4,11);
	CMS_lumi(c,5,0);
	c->Update();
	// c->SetGrid();
	c->RedrawAxis();
	c->GetFrame()->Draw();
	// c->SetLogx();
	c->SetLogy();
    c->Print("limits/"+channel+".pdf");
}
