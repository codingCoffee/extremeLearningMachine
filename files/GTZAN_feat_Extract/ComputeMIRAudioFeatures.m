%%% A function to extract various features from audio clips. It uses the MIRtoolbox

function Feats = ComputeMIRAudioFeatures(filename, output)

Feats = [];

[s] = auread(filename);
s1 = miraudio(s);

f = mirfeatures(s1);
f_rms = mirstat(f.dynamics.rms);
Feats = [Feats f_rms.Mean f_rms.Std f_rms.Slope];

f_fpeak = mirstat(f.fluctuation.peak);
Feats = [Feats f_fpeak.PeakPosMean f_fpeak.PeakMagMean];

f_fcentroid = mirstat(f.fluctuation.centroid);
Feats = [Feats f_fcentroid.Mean];

f_ronsets = mirstat(f.rhythm.tmp.onsets);
Feats = [Feats f_ronsets.PeakPosMean f_ronsets.PeakMagMean];

f_rtempo = mirstat(f.rhythm.tempo);
Feats = [Feats f_rtempo.Mean f_rtempo.Std f_rtempo.Slope];

f_rattacktime = mirstat(f.rhythm.attack.time);
Feats = [Feats f_rattacktime.Mean f_rattacktime.Std f_rattacktime.Slope];

f_rattackslope = mirstat(f.rhythm.attack.slope);
Feats = [Feats f_rattackslope.Mean f_rattackslope.Std f_rattackslope.Slope];

f_tzcr = mirstat(f.timbre.zerocross);
Feats = [Feats f_tzcr.Mean f_tzcr.Std f_tzcr.Slope];

f_tlowenergy = mirstat(f.timbre.lowenergy);
Feats = [Feats f_tlowenergy.Mean];

f_tspectralflux = mirstat(f.timbre.spectralflux);
Feats = [Feats f_tspectralflux.Mean f_tspectralflux.Std f_tspectralflux.Slope];

f_scentroid = mirstat(f.spectral.centroid);
Feats = [Feats f_scentroid.Mean f_scentroid.Std f_scentroid.Slope];

f_sbrightness=mirstat(f.spectral.brightness);
Feats = [Feats f_sbrightness.Mean f_sbrightness.Std f_sbrightness.Slope];

f_sspread = mirstat(f.spectral.spread);
Feats = [Feats f_sspread.Mean f_sspread.Std f_sspread.Slope];

f_sskewness = mirstat(f.spectral.skewness);
Feats = [Feats f_sskewness.Mean f_sskewness.Std f_sskewness.Slope];

f_sspectralentropy = mirstat(f.spectral.spectentropy);
Feats = [Feats f_sspectralentropy.Mean f_sspectralentropy.Std f_sspectralentropy.Slope];

f_skurtosis = mirstat(f.spectral.kurtosis);
Feats = [Feats f_skurtosis.Mean f_skurtosis.Std f_skurtosis.Slope];

f_sirregularity = mirstat(f.spectral.irregularity);
Feats = [Feats f_sirregularity.Mean f_sirregularity.Std f_sirregularity.Slope];

f_sflatness = mirstat(f.spectral.flatness);
Feats = [Feats f_sflatness.Mean f_sflatness.Std f_sflatness.Slope];

f_sroughness = mirstat(f.spectral.roughness);
Feats = [Feats f_sroughness.Mean f_sroughness.Std f_sroughness.Slope];

f_srolloff85 = mirstat(f.spectral.rolloff85);
Feats = [Feats f_srolloff85.Mean f_srolloff85.Std f_srolloff85.Slope];

f_srolloff95 = mirstat(f.spectral.rolloff95);
Feats = [Feats f_srolloff95.Mean f_srolloff95.Std f_srolloff95.Slope];

f_smfcc = mirstat(f.spectral.mfcc);
i=1;
while i<14
Feats = [Feats f_smfcc.Mean(i) f_smfcc.Std(i) f_smfcc.Slope(i)];
i=i+1;
end

f_sdmfcc = mirstat(f.spectral.dmfcc);
i=1;
while i<14
Feats = [Feats f_sdmfcc.Mean(i) f_sdmfcc.Std(i) f_sdmfcc.Slope(i)];
i=i+1;
end

f_sddmfcc = mirstat(f.spectral.ddmfcc);
i=1;
while i<14
Feats = [Feats f_sddmfcc.Mean(i) f_sddmfcc.Std(i) f_sddmfcc.Slope(i)];
i=i+1;
end

f_tochromagram = mirstat(f.tonal.chromagram.peak);
Feats = [Feats f_tochromagram.PeakPosMean f_tochromagram.PeakPosStd f_tochromagram.PeakPosSlope f_tochromagram.PeakMagMean f_tochromagram.PeakMagStd f_tochromagram.PeakMagSlope];

f_tocentroid = mirstat(f.tonal.chromagram.centroid);
Feats = [Feats f_tocentroid.Mean f_tocentroid.Std f_tocentroid.Slope];

f_tokeyclarity = mirstat(f.tonal.keyclarity);
Feats = [Feats f_tokeyclarity.Mean f_tokeyclarity.Std f_tokeyclarity.Slope];

f_tomode = mirstat(f.tonal.mode);
Feats = [Feats f_tomode.Mean f_tomode.Std f_tomode.Slope];

f_tohcdf=mirstat(f.tonal.hcdf);
Feats = [Feats f_tohcdf.Mean f_tohcdf.Std f_tohcdf.Slope];

% save(strcat('features_f',int2str(output),'.mat'),'Feats');
end