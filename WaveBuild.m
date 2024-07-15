function [mywave,fs] = WaveBuild(octave, note_num,Basicfreq,t)
% returns the note frequency and basic wave(signal) 

time=0:1/Basicfreq:t;
HarmonicWave=0;

% frequency formula for piano notes
fs = 440*(2^(((octave*12)+note_num-49)/12));

% the next part makes a signal from the current frequancy

k=2*pi*fs*time;

%realization of the analysis equation with w0=0.007 and 14(7*2) coefficients
%gives more harmonic sound
for i=1:7
HarmonicWave=HarmonicWave+sin(i*k).*exp(-0.007*k)./(2^i); 
end

mywave=HarmonicWave/2; %moderate the sound
end

