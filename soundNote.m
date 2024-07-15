function [] = soundNote(octave,note_num,Basicfreq,t)
%  generates a sound from a given octave, note number, frequency and duration. It generates a basic waveform, applies an 
% amplitude envelope and convolves it with an impulse response.
%gives echo to the sound


    [wave,fs]=WaveBuild(octave, note_num,Basicfreq,t);
    wave_enveloped = PianoAmplitude(wave,Basicfreq);

    % Load an impulse response of a room or space
    addpath('C:\Users\Asus\Documents\PianoMatlabProj\impulse_response', 'permanent');
    % this function returns the sampled data in y and the sample rate fs, in Hertz.
    [y, Fs] = audioread('impulse_response/church.wav');
     %reshape the array y into a column vector.
    impulse_response = reshape(y,[],1);

    % Convolve the waveform with the impulse response
    reverb_effect = conv(wave_enveloped, impulse_response);

    % Design a low-pass filter
    %Frequencies below the cutoff frequency pass through the filter with minimal attenuation
    cutoff_frequency = fs; 
    filter_order = 3; % Filter order:determining the sharpness of the transition between the passband and the stopband.
    [A,B] = butter(filter_order, cutoff_frequency/(Basicfreq/2), 'low');
    filteredWave = filter(A, B, reverb_effect);

    % play sound
    sound(filteredWave,Basicfreq,24);
    end