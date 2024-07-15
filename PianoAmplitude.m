function wave_enveloped = PianoAmplitude(wave, fs)
    %In sound and music, an envelope describes how a sound changes over time. 
    % this function Generates this envelope: variation of the audio signal's amplitude over time
    % makes the envelope by calculating the number of samples corresponding to each phase based on fs and the specified durations
    %make the sound to be heard more like a piano

    % Envelope stages
    attack_time = 0.03; % Time it takes for the sound to reach its maximum amplitude (in seconds)
    decay_time = 0.05;  % Time it takes for the sound to transition from the maximum amplitude to the sustain level (in seconds)
    sustain_time = 0.7; % Duration of the sustain level (in seconds)
    release_time = 0.1; % Time it takes for the sound to fade out from the sustain level to silence (in seconds)

     %creates a zero-filled array  with  the length of the input wave
    Myenv = zeros(1, length(wave));

    % Number of samples in the attack phase
    attack_samples = (attack_time * fs); 
    Myenv(1:attack_samples) = linspace(0, 1, attack_samples);

    % Decay phase
    decay_samples = (decay_time * fs);
    Myenv(attack_samples + 1:attack_samples + decay_samples) = linspace(1, sustain_time, decay_samples);

    % Sustain phase
    sustain_samples = (sustain_time * fs);
    Myenv(attack_samples + decay_samples + 1:attack_samples + decay_samples + sustain_samples) = sustain_time;

    % Release phase
    release_samples = (release_time * fs);
    Myenv(attack_samples + decay_samples + sustain_samples + 1:attack_samples + decay_samples + sustain_samples + release_samples) = linspace(sustain_time, 0, release_samples);

    % now we have envelope with sampels of all the stages of time
    % fits the envelope to the waveform length
    Myenv = Myenv(1:length(wave));
    wave_enveloped = wave .* Myenv;
end
