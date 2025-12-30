/**
 * Visualizer Service - Audio visualization
 * Migrated from Android Visualizer Service
 */

export type VisualizerStyle = 'bars' | 'waveform' | 'circular' | 'particles';

export class VisualizerService {
  private canvas: HTMLCanvasElement | null = null;
  private ctx: CanvasRenderingContext2D | null = null;
  private animationId: number | null = null;
  private analyser: AnalyserNode | null = null;

  initialize(canvas: HTMLCanvasElement, analyser: AnalyserNode): void {
    this.canvas = canvas;
    this.ctx = canvas.getContext('2d');
    this.analyser = analyser;
  }

  start(style: VisualizerStyle = 'bars'): void {
    if (!this.canvas || !this.ctx || !this.analyser) {
      console.error('Visualizer not initialized');
      return;
    }

    this.stop();

    const render = () => {
      if (!this.ctx || !this.canvas || !this.analyser) return;

      const bufferLength = this.analyser.frequencyBinCount;
      const dataArray = new Uint8Array(bufferLength);
      this.analyser.getByteFrequencyData(dataArray);

      this.ctx.fillStyle = 'rgb(0, 0, 0)';
      this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);

      switch (style) {
        case 'bars':
          this.renderBars(dataArray);
          break;
        case 'waveform':
          this.renderWaveform(dataArray);
          break;
        case 'circular':
          this.renderCircular(dataArray);
          break;
        case 'particles':
          this.renderParticles(dataArray);
          break;
      }

      this.animationId = requestAnimationFrame(render);
    };

    render();
  }

  private renderBars(dataArray: Uint8Array): void {
    if (!this.ctx || !this.canvas) return;

    const barWidth = (this.canvas.width / dataArray.length) * 2.5;
    let x = 0;

    for (let i = 0; i < dataArray.length; i++) {
      const barHeight = (dataArray[i] / 255) * this.canvas.height;

      const r = barHeight + 25 * (i / dataArray.length);
      const g = 250 * (i / dataArray.length);
      const b = 50;

      this.ctx.fillStyle = `rgb(${r}, ${g}, ${b})`;
      this.ctx.fillRect(x, this.canvas.height - barHeight, barWidth, barHeight);

      x += barWidth + 1;
    }
  }

  private renderWaveform(dataArray: Uint8Array): void {
    if (!this.ctx || !this.canvas) return;

    this.ctx.lineWidth = 2;
    this.ctx.strokeStyle = 'rgb(0, 200, 255)';
    this.ctx.beginPath();

    const sliceWidth = this.canvas.width / dataArray.length;
    let x = 0;

    for (let i = 0; i < dataArray.length; i++) {
      const v = dataArray[i] / 255;
      const y = v * this.canvas.height;

      if (i === 0) {
        this.ctx.moveTo(x, y);
      } else {
        this.ctx.lineTo(x, y);
      }

      x += sliceWidth;
    }

    this.ctx.lineTo(this.canvas.width, this.canvas.height / 2);
    this.ctx.stroke();
  }

  private renderCircular(dataArray: Uint8Array): void {
    if (!this.ctx || !this.canvas) return;

    const centerX = this.canvas.width / 2;
    const centerY = this.canvas.height / 2;
    const radius = Math.min(centerX, centerY) - 50;

    for (let i = 0; i < dataArray.length; i++) {
      const angle = (i / dataArray.length) * Math.PI * 2;
      const barHeight = (dataArray[i] / 255) * 100;

      const x1 = centerX + Math.cos(angle) * radius;
      const y1 = centerY + Math.sin(angle) * radius;
      const x2 = centerX + Math.cos(angle) * (radius + barHeight);
      const y2 = centerY + Math.sin(angle) * (radius + barHeight);

      const hue = (i / dataArray.length) * 360;
      this.ctx.strokeStyle = `hsl(${hue}, 100%, 50%)`;
      this.ctx.lineWidth = 2;
      this.ctx.beginPath();
      this.ctx.moveTo(x1, y1);
      this.ctx.lineTo(x2, y2);
      this.ctx.stroke();
    }
  }

  private renderParticles(dataArray: Uint8Array): void {
    if (!this.ctx || !this.canvas) return;

    for (let i = 0; i < dataArray.length; i += 4) {
      const value = dataArray[i];
      const x = Math.random() * this.canvas.width;
      const y = Math.random() * this.canvas.height;
      const size = (value / 255) * 10;

      this.ctx.fillStyle = `rgba(${value}, 100, 255, 0.5)`;
      this.ctx.beginPath();
      this.ctx.arc(x, y, size, 0, Math.PI * 2);
      this.ctx.fill();
    }
  }

  stop(): void {
    if (this.animationId !== null) {
      cancelAnimationFrame(this.animationId);
      this.animationId = null;
    }
  }

  cleanup(): void {
    this.stop();
    this.canvas = null;
    this.ctx = null;
    this.analyser = null;
  }
}

export default new VisualizerService();
