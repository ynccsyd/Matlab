n=[0:44000];
fs=44000;
Sina=sin(2*pi*150.*n/fs); % Sinus signal of 30 Hz sampled at 44000 Hz
t=linspace (0,1,44001);   % time graph
xlabel('t time');
ylabel('Sina'); title('graphic of bass sound')
Sinb=sin(2*pi*15000.*n/fs);

soundsc (Sina, 44000) ;  % bass sound
soundsc (Sinb, 44000) ;  %treble sound
Sina_spec=fft(Sina);    %FFT fast fourier transform
f=linspace(-22000, 22000,44001); % The range -fs/2,+fs/2 was chosen to make the FT symmetrical.
plot (f,abs(fftshift (Sina_spec))); %fftshift shifts the 0-2pi range to the -pi,+pi range.
Sinb_spec=fft (Sinb);
plot (f,abs(fftshift (Sinb_spec)));

%to sum signals
SumSignal=Sina+Sinb;
sound (SumSignal, 44000) ;
SumSignal_spec=fft (SumSignal);
plot(f,abs(fftshift (SumSignal_spec))) ;title('spectrum of the sum signal');
xlabel ('frequency') ;ylabel ('amplitude');