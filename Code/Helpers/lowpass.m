function [outputArg1] = lowpass(inputArg1,inputArg2)

Fi1=designfilt('lowpassfir', 'PassbandFrequency',1, 'StopbandFrequency', 2, 'PassbandRipple', 1, 'StopbandAttenuation', 10, 'SampleRate', 100, 'DesignMethod', 'kaiserwin');


ai=filter(Fi1,i1); % ai is now the new data filtered and no DC 



end

