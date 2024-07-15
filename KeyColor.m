function color = KeyColor(note_num)
    % buttonColor Returns the color to which the button should be changed 

    colors = {
        'blue',     [0 0.4470 0.7410];
        'orange',   [0.8500 0.3250 0.0980];
        'yellow',   [0.9290 0.6940 0.1250];
        'purple',   [0.4940 0.1840 0.5560];
        'green',    [0.4660 0.6740 0.1880];
        'cyan',     [0.3010 0.7450 0.9330];
        'red',      [0.6350 0.0780 0.1840];
        'yellow',   [1 1 0];
        'cyan',     [0 1 1];
        'magenta',  [1 0 1];
        'green',    [0 1 0];
        'red',      [1 0 0]
    };
    color = colors{note_num, 2}; % Get the color based on notenum on RGB number between 0-1
end


