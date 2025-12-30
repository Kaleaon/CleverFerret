/**
 * PDF Reader Service
 *
 * Handles PDF file reading using pdf.js
 */

import * as pdfjsLib from 'pdfjs-dist';

// Set worker source
if (typeof window !== 'undefined') {
  pdfjsLib.GlobalWorkerOptions.workerSrc = `//cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjsLib.version}/pdf.worker.min.js`;
}

export interface PDFDocument {
  doc: pdfjsLib.PDFDocumentProxy;
  numPages: number;
  title?: string;
  author?: string;
}

export interface PDFPage {
  pageNumber: number;
  width: number;
  height: number;
  render: (options?: { scale?: number; canvas?: HTMLCanvasElement }) => Promise<HTMLCanvasElement>;
}

export class PDFReaderService {
  private currentDocument: PDFDocument | null = null;

  /**
   * Load a PDF file
   */
  async loadPDF(file: File | Blob | ArrayBuffer | string): Promise<PDFDocument> {
    try {
      let loadingTask: pdfjsLib.PDFDocumentLoadingTask;

      if (file instanceof File || file instanceof Blob) {
        const arrayBuffer = await file.arrayBuffer();
        loadingTask = pdfjsLib.getDocument({ data: arrayBuffer });
      } else if (file instanceof ArrayBuffer) {
        loadingTask = pdfjsLib.getDocument({ data: file });
      } else {
        loadingTask = pdfjsLib.getDocument({ url: file });
      }

      const doc = await loadingTask.promise;

      const metadata = await doc.getMetadata().catch(() => null);

      const pdfDoc: PDFDocument = {
        doc,
        numPages: doc.numPages,
        title: metadata?.info?.Title,
        author: metadata?.info?.Author,
      };

      this.currentDocument = pdfDoc;
      return pdfDoc;
    } catch (error) {
      throw new Error(
        `Failed to load PDF: ${error instanceof Error ? error.message : 'Unknown error'}`,
      );
    }
  }

  /**
   * Get a specific page
   */
  async getPage(document: PDFDocument, pageNumber: number): Promise<PDFPage> {
    if (pageNumber < 1 || pageNumber > document.numPages) {
      throw new Error(`Page ${pageNumber} is out of range (1-${document.numPages})`);
    }

    const page = await document.doc.getPage(pageNumber);
    const viewport = page.getViewport({ scale: 1.0 });

    return {
      pageNumber,
      width: viewport.width,
      height: viewport.height,
      render: async (options: { scale?: number; canvas?: HTMLCanvasElement } = {}) => {
        const scale = options.scale || 1.5;
        const scaledViewport = page.getViewport({ scale });

        const canvas = options.canvas || document.createElement('canvas');
        const context = canvas.getContext('2d');

        if (!context) {
          throw new Error('Could not get canvas context');
        }

        canvas.height = scaledViewport.height;
        canvas.width = scaledViewport.width;

        const renderContext = {
          canvasContext: context,
          viewport: scaledViewport,
        };

        const renderTask = page.render(renderContext);
        await renderTask.promise;
        return canvas;
      },
    };
  }

  /**
   * Get total number of pages
   */
  getPageCount(document: PDFDocument): number {
    return document.numPages;
  }

  /**
   * Get current document
   */
  getCurrentDocument(): PDFDocument | null {
    return this.currentDocument;
  }

  /**
   * Clear current document
   */
  clear(): void {
    this.currentDocument = null;
  }
}

export const pdfReaderService = new PDFReaderService();
