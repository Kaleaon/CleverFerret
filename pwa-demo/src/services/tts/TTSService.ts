/**
 * Text-to-Speech Service - Web Speech API wrapper
 * Migrated from Android TTS Service
 */

export interface TTSVoice {
  name: string;
  lang: string;
  voiceURI: string;
}

export class TTSService {
  private synth: SpeechSynthesis | null = null;
  private currentUtterance: SpeechSynthesisUtterance | null = null;
  private isPaused = false;

  constructor() {
    if (typeof window !== 'undefined' && 'speechSynthesis' in window) {
      this.synth = window.speechSynthesis;
    }
  }

  getAvailableVoices(): TTSVoice[] {
    if (!this.synth) return [];
    
    const voices = this.synth.getVoices();
    return voices.map(v => ({
      name: v.name,
      lang: v.lang,
      voiceURI: v.voiceURI,
    }));
  }

  speak(text: string, options?: {
    lang?: string;
    rate?: number;
    pitch?: number;
    volume?: number;
    voice?: string;
  }): void {
    if (!this.synth) {
      console.error('Speech synthesis not supported');
      return;
    }

    this.stop();

    this.currentUtterance = new SpeechSynthesisUtterance(text);
    
    if (options) {
      if (options.lang) this.currentUtterance.lang = options.lang;
      if (options.rate) this.currentUtterance.rate = options.rate;
      if (options.pitch) this.currentUtterance.pitch = options.pitch;
      if (options.volume !== undefined) this.currentUtterance.volume = options.volume;
      
      if (options.voice) {
        const voices = this.synth.getVoices();
        const selectedVoice = voices.find(v => v.name === options.voice);
        if (selectedVoice) {
          this.currentUtterance.voice = selectedVoice;
        }
      }
    }

    this.synth.speak(this.currentUtterance);
    this.isPaused = false;
  }

  pause(): void {
    if (this.synth && this.synth.speaking && !this.synth.paused) {
      this.synth.pause();
      this.isPaused = true;
    }
  }

  resume(): void {
    if (this.synth && this.synth.paused) {
      this.synth.resume();
      this.isPaused = false;
    }
  }

  stop(): void {
    if (this.synth) {
      this.synth.cancel();
      this.currentUtterance = null;
      this.isPaused = false;
    }
  }

  isSpeaking(): boolean {
    return this.synth ? this.synth.speaking : false;
  }

  isPausedState(): boolean {
    return this.isPaused;
  }
}

export default new TTSService();
