import { GoogleGenAI, Type } from "@google/genai";
import { MediaItem, MediaType } from '../types';

if (!process.env.API_KEY) {
  console.warn("API_KEY environment variable not set. Gemini features will be disabled.");
}

const ai = new GoogleGenAI({ apiKey: process.env.API_KEY! });

const enhanceMetadataSchema = {
  type: Type.OBJECT,
  properties: {
    summary: {
      type: Type.STRING,
      description: "A compelling one-paragraph summary of the media item.",
    },
    genres: {
      type: Type.ARRAY,
      items: { type: Type.STRING },
      description: "An array of 3 to 5 relevant genres.",
    },
    releaseDate: {
      type: Type.STRING,
      description: "The original release date in YYYY-MM-DD format.",
    },
    isbn: {
      type: Type.STRING,
      description: "The ISBN-13 of the book, if applicable. Otherwise, null.",
    },
     publisher: {
      type: Type.STRING,
      description: "The publisher of the book, if applicable. Otherwise, null.",
    },
  },
  required: ["summary", "genres", "releaseDate"],
};


export const enhanceMetadata = async (item: MediaItem): Promise<Partial<MediaItem>> => {
  if (!process.env.API_KEY) {
    throw new Error("Gemini API key is not configured.");
  }

  const primaryCreatorType = item.type === MediaType.Book ? 'Author' : item.type === MediaType.Movie ? 'Director' : 'Artist';
  const primaryCreators = item.authors || item.directors || item.artists || [];
  
  const prompt = `Enhance the metadata for the following ${item.type}:
  - Title: "${item.title}"
  - ${primaryCreatorType}(s): ${primaryCreators.join(', ')}
  
  Please provide a compelling one-paragraph summary, 3-5 relevant genres, the original release date, and the publisher/ISBN if it's a book.
  Format your response strictly according to the provided JSON schema.`;
  
  try {
    const response = await ai.models.generateContent({
      model: "gemini-2.5-flash",
      contents: prompt,
      config: {
        responseMimeType: "application/json",
        responseSchema: enhanceMetadataSchema,
      },
    });

    const jsonString = response.text.trim();
    const parsedData = JSON.parse(jsonString);

    const enhancedData: Partial<MediaItem> = {
      summary: parsedData.summary,
      genres: parsedData.genres,
      releaseDate: parsedData.releaseDate,
    };

    if (item.type === MediaType.Book) {
      if (parsedData.isbn) enhancedData.isbn = parsedData.isbn;
      if (parsedData.publisher) enhancedData.publisher = parsedData.publisher;
    }
    
    return enhancedData;

  } catch (error) {
    console.error("Error enhancing metadata with Gemini:", error);
    throw new Error("Failed to generate enhanced metadata.");
  }
};

export const generateCoverArtPrompt = async (item: MediaItem): Promise<string> => {
  if (!process.env.API_KEY) {
    throw new Error("Gemini API key is not configured.");
  }
  
  const primaryCreatorType = item.type === MediaType.Book ? 'Author' : item.type === MediaType.Movie ? 'Director' : 'Artist';
  const primaryCreators = item.authors || item.directors || item.artists || [];

  const prompt = `
    Based on the following metadata for a ${item.type}, generate a detailed, artistic, and evocative prompt for an AI image generator (like Midjourney or DALL-E) to create compelling cover art.
    The prompt should be a single paragraph and focus on visual elements, mood, color palette, and composition. Do not include any text in the image itself.

    - Title: "${item.title}"
    - ${primaryCreatorType}(s): ${primaryCreators.join(', ')}
    - Summary: ${item.summary || 'No summary provided.'}
    - Genres: ${item.genres?.join(', ') || 'No genres provided.'}
  `;

  try {
    const response = await ai.models.generateContent({
      model: 'gemini-2.5-flash',
      contents: prompt,
    });
    return response.text.trim();
  } catch (error) {
    console.error("Error generating cover art prompt with Gemini:", error);
    throw new Error("Failed to generate cover art prompt.");
  }
};
