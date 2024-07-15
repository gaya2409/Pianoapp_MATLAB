function [octave,note_num] = octave_note(str)
%returns the octave and note number

% the next part splits the string into three parts: number for the octave, a string for the note, and a boolean whether the note is a diaz

    % Extracts the note
    note = regexp(str, '[A-G][A-Za-z]*', 'match', 'once'); 
    % Extract the isSharp boolean value 
    if contains(str, "#")
    isSharp=1;
    else
    isSharp=0; 
    end
    % Extract the octave 
    octave = str2double(regexp(str, '[0-9]*', 'match', 'once'));

%gives the number of the note (from 12 tones-on one octave)
notenums=["A" "B" "C" "D" "E" "F" "G";1 3 4 6 8 9 11]; %mat of notes and their suitable num for calculating the notes frequancy 
[row,col] = find(notenums==note);
%returns the note number that will enter to the frequancy formula (the suitable number of the note+isSharp)
note_num=isSharp+str2double(notenums(2,col)); 

end

