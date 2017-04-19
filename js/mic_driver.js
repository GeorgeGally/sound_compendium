var mic = new Microphone();
var play = false;
var frameBufferSize = 4096;
var bufferSize = frameBufferSize/2;
var fft = new FFT(bufferSize, 44100);
mic.initialize();


var soundVols = setInterval(function() {
	if (play != false){
	document.getElementById('autoNote').innerHTML = mic.getNote(1);
	document.getElementById('autoCents').innerHTML = mic.getNoteCents(1)[1];
	document.getElementById('fftNote').innerHTML = mic.getNote(2);
	document.getElementById('fftCents').innerHTML = mic.getNoteCents(2)[1];
	document.getElementById('fftFreq100').innerHTML = mic.getSprectrum(100);
	document.getElementById('fftFreq1000').innerHTML = mic.getSprectrum(200);
	//audioAvailable(mic);
	}
}, 100);


function checkMic() {
    if (!mic.isInitialized()) {
        setTimeout("checkMic();", 1000);
        //console.log("----" + isInitialized);
        return;
    } else {
		mic.startListening();
		play = true;
    }
}

 checkMic();




