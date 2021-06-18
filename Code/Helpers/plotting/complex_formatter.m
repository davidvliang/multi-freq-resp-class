function [Bcom] = complex_formatter(Bcell)

% new version that accomodates hardware limitations and 


bs = 100000; % batch size (arbitrarily chosen)
foo = Bcell(:);
Bcom = zeros(size(foo));

loops = fix(size(foo,1)/bs);
startpoint = 1;
endpoint = 100000;

fprintf("Converting %d values on each loop", bs)

% full sized loops
for i=1:loops
    Bcom(startpoint:endpoint) = str2num(char(foo(startpoint:endpoint)));
    
    startpoint = startpoint + bs;
    endpoint = endpoint + bs;
    
    fprintf("Loop %d of %d\n", i, loops+1);
    
end

% final loop (may not be full sized)
newstart = fix(size(foo,1)/bs)*bs;
Bcom(newstart+1:size(foo)) = str2num(char(foo(newstart+1:size(foo))));
fprintf("Loop %d of %d\n", loops+1, loops+1);

fprintf("Reshaping...\n");
Bcom = reshape(Bcom, size(Bcell));

disp("done!")

end