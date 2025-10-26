
import React, { useState, useEffect } from 'react';
import { MediaItem, MediaItemWithOriginal, MediaType } from '../types';
import { CloseIcon, SparklesIcon, LoadingIcon, ImageIcon } from './icons';
import { enhanceMetadata, generateCoverArtPrompt } from '../services/geminiService';

interface ChipInputProps {
  values: string[];
  onChange: (values: string[]) => void;
  label: string;
}

const ChipInput: React.FC<ChipInputProps> = ({ values, onChange, label }) => {
  const [inputValue, setInputValue] = useState('');

  const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === 'Enter' && inputValue.trim()) {
      e.preventDefault();
      if (!values.includes(inputValue.trim())) {
        onChange([...values, inputValue.trim()]);
      }
      setInputValue('');
    }
  };

  const removeChip = (index: number) => {
    onChange(values.filter((_, i) => i !== index));
  };

  return (
    <div>
      <label className="block text-sm font-medium text-light-slate">{label}</label>
      <div className="mt-1 flex flex-wrap gap-2 p-2 bg-navy border border-lightest-navy rounded-md">
        {values.map((value, index) => (
          <div key={index} className="flex items-center bg-lightest-navy text-lightest-slate text-sm px-2 py-1 rounded-full">
            <span>{value}</span>
            <button onClick={() => removeChip(index)} className="ml-2 text-slate hover:text-white">
              <CloseIcon className="w-3 h-3" />
            </button>
          </div>
        ))}
        <input
          type="text"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder={`Add ${label.toLowerCase()}...`}
          className="bg-transparent focus:outline-none text-lightest-slate flex-grow"
        />
      </div>
    </div>
  );
};


interface StarRatingProps {
  rating: number;
  onRatingChange: (rating: number) => void;
}

const StarRating: React.FC<StarRatingProps> = ({ rating, onRatingChange }) => {
  return (
    <div className="flex items-center">
      {[1, 2, 3, 4, 5].map((star) => (
        <svg
          key={star}
          onClick={() => onRatingChange(star === rating ? 0 : star)}
          className={`w-6 h-6 cursor-pointer ${rating >= star ? 'text-gold' : 'text-slate'}`}
          fill="currentColor"
          viewBox="0 0 20 20"
        >
          <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
        </svg>
      ))}
    </div>
  );
};

interface MetadataEditorProps {
  item: MediaItemWithOriginal;
  onClose: () => void;
  onSave: (updatedItem: MediaItem) => void;
}

const MetadataEditor: React.FC<MetadataEditorProps> = ({ item, onClose, onSave }) => {
  const [formData, setFormData] = useState<MediaItemWithOriginal>(item);
  const [isEnhancing, setIsEnhancing] = useState(false);
  const [enhanceError, setEnhanceError] = useState('');
  const [isGeneratingPrompt, setIsGeneratingPrompt] = useState(false);
  const [promptError, setPromptError] = useState('');
  const [promptCopied, setPromptCopied] = useState(false);

  useEffect(() => {
    setFormData(item);
  }, [item]);

  const handleChange = (field: keyof MediaItem, value: any) => {
    setFormData(prev => ({ ...prev, [field]: value }));
  };

  const handleSave = () => {
    const { original, ...rest } = formData;
    onSave(rest);
  };
  
  const handleEnhance = async () => {
    setIsEnhancing(true);
    setEnhanceError('');
    try {
      const enhancedData = await enhanceMetadata(formData);
      setFormData(prev => ({
        ...prev,
        ...enhancedData,
        original: { ...prev.original, ...prev } // Preserve current state as original before overwriting
      }));
    } catch (error: any) {
        setEnhanceError(error.message || 'An unknown error occurred.');
    } finally {
      setIsEnhancing(false);
    }
  };

  const handleGenerateCoverPrompt = async () => {
    setIsGeneratingPrompt(true);
    setPromptError('');
    try {
      const prompt = await generateCoverArtPrompt(formData);
      handleChange('aiCoverArtPrompt', prompt);
    } catch (error: any) {
      setPromptError(error.message || 'An unknown error occurred.');
    } finally {
      setIsGeneratingPrompt(false);
    }
  };

  const copyPromptToClipboard = () => {
    if (formData.aiCoverArtPrompt) {
      navigator.clipboard.writeText(formData.aiCoverArtPrompt);
      setPromptCopied(true);
      setTimeout(() => setPromptCopied(false), 2000);
    }
  };

  const renderInputField = (label: string, field: keyof MediaItem, type: string = 'text', multiline: boolean = false) => {
    const originalValue = item.original?.[field] as string | undefined;
    const hasChanged = originalValue !== undefined && originalValue !== formData[field];
    
    const inputProps = {
        id: field,
        value: formData[field] as string || '',
        onChange: (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => handleChange(field, e.target.value),
        className:"w-full p-2 bg-navy border border-lightest-navy rounded-md focus:outline-none focus:ring-2 focus:ring-emerald text-lightest-slate"
    };

    return (
        <div>
            <label htmlFor={field} className="block text-sm font-medium text-light-slate">{label}</label>
            {multiline ? <textarea {...inputProps} rows={4} /> : <input type={type} {...inputProps} />}
            {hasChanged && <p className="text-xs text-slate mt-1 line-through">~~ {originalValue} ~~</p>}
        </div>
    );
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-75 flex items-center justify-center z-50 p-4">
      <div className="bg-light-navy w-full max-w-4xl max-h-[90vh] rounded-lg shadow-xl flex flex-col">
        <div className="flex justify-between items-center p-4 border-b border-lightest-navy">
          <h2 className="text-xl font-bold text-lightest-slate">Edit Metadata</h2>
          <button onClick={onClose} className="text-slate hover:text-white">
            <CloseIcon />
          </button>
        </div>
        
        <div className="flex-grow overflow-y-auto p-4 md:p-6">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {/* Left Column: Cover Art & Actions */}
            <div className="md:col-span-1 flex flex-col items-center gap-4">
              <img src={formData.coverArt} alt={formData.title} className="w-full h-auto object-cover rounded-md shadow-lg" />
              <div className="w-full space-y-2">
                <button
                  onClick={handleEnhance}
                  disabled={isEnhancing}
                  className="w-full flex items-center justify-center gap-2 bg-emerald text-navy font-bold py-2 px-4 rounded-md hover:bg-opacity-90 transition-colors disabled:bg-slate disabled:cursor-not-allowed"
                >
                  {isEnhancing ? <LoadingIcon /> : <SparklesIcon />}
                  <span>{isEnhancing ? 'Enhancing...' : 'Smart Enhance'}</span>
                </button>
                <button
                  onClick={handleGenerateCoverPrompt}
                  disabled={isGeneratingPrompt}
                  className="w-full flex items-center justify-center gap-2 bg-lightest-navy text-light-slate font-bold py-2 px-4 rounded-md hover:bg-slate transition-colors disabled:bg-slate disabled:cursor-not-allowed"
                >
                  {isGeneratingPrompt ? <LoadingIcon /> : <ImageIcon />}
                  <span>{isGeneratingPrompt ? 'Generating...' : 'Cover Prompt'}</span>
                </button>
              </div>
              {enhanceError && <p className="text-sm text-red-400 text-center">{enhanceError}</p>}
              {promptError && <p className="text-sm text-red-400 text-center">{promptError}</p>}
            </div>

            {/* Right Column: Metadata Fields */}
            <div className="md:col-span-2 space-y-4">
              {renderInputField('Title', 'title')}
              {renderInputField('Subtitle', 'subtitle')}
              
              <ChipInput
                label={formData.type === MediaType.Book ? 'Authors' : formData.type === MediaType.Movie ? 'Directors' : 'Artists'}
                values={(formData.authors || formData.directors || formData.artists) ?? []}
                onChange={(values) => {
                  const field = formData.type === MediaType.Book ? 'authors' : formData.type === MediaType.Movie ? 'directors' : 'artists';
                  handleChange(field, values);
                }}
              />
              
              {renderInputField('Summary', 'summary', 'text', true)}

              {formData.aiCoverArtPrompt && (
                <div>
                  <label className="block text-sm font-medium text-light-slate">AI Cover Art Prompt</label>
                  <div className="relative">
                    <textarea
                      readOnly
                      value={formData.aiCoverArtPrompt}
                      className="w-full p-2 bg-navy border border-lightest-navy rounded-md text-slate text-sm mt-1"
                      rows={3}
                    />
                    <button
                      onClick={copyPromptToClipboard}
                      className="absolute top-2 right-2 bg-slate text-navy px-2 py-1 text-xs font-bold rounded hover:bg-light-slate"
                    >
                      {promptCopied ? 'Copied!' : 'Copy'}
                    </button>
                  </div>
                </div>
              )}

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {renderInputField('Series', 'series')}
                {renderInputField('Series Index', 'seriesIndex', 'number')}
              </div>
              
               <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {renderInputField('Release Date', 'releaseDate', 'date')}
                <div>
                   <label className="block text-sm font-medium text-light-slate">Rating</label>
                   <StarRating rating={formData.rating ?? 0} onRatingChange={(r) => handleChange('rating', r)} />
                </div>
              </div>

              <ChipInput
                label="Genres"
                values={formData.genres ?? []}
                onChange={(values) => handleChange('genres', values)}
              />

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {renderInputField('Publisher', 'publisher')}
                {formData.type === MediaType.Book && renderInputField('ISBN', 'isbn')}
              </div>

            </div>
          </div>
        </div>

        <div className="flex justify-end gap-4 p-4 border-t border-lightest-navy">
          <button onClick={onClose} className="px-4 py-2 rounded-md bg-lightest-navy text-lightest-slate hover:bg-slate">Cancel</button>
          <button onClick={handleSave} className="px-6 py-2 rounded-md bg-emerald text-navy font-bold hover:bg-opacity-90">Save</button>
        </div>
      </div>
    </div>
  );
};

export default MetadataEditor;
