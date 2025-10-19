
import React, { useState } from 'react';
import { MediaType } from '../types';
import { CloseIcon } from './icons';

interface AddMediaModalProps {
  onClose: () => void;
  onAdd: (title: string, type: MediaType, creator: string) => void;
}

const AddMediaModal: React.FC<AddMediaModalProps> = ({ onClose, onAdd }) => {
  const [title, setTitle] = useState('');
  const [mediaType, setMediaType] = useState<MediaType>(MediaType.Book);
  const [creator, setCreator] = useState('');

  const getCreatorLabel = (type: MediaType) => {
    switch (type) {
      case MediaType.Book:
      case MediaType.Comic:
        return 'Author';
      case MediaType.Movie:
        return 'Director';
      case MediaType.Music:
      case MediaType.Podcast:
        return 'Artist';
      default:
        return 'Creator';
    }
  };

  const handleSubmit = () => {
    if (title.trim() && creator.trim()) {
      onAdd(title, mediaType, creator);
    }
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-75 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-light-navy w-full max-w-md rounded-lg shadow-xl flex flex-col" onClick={(e) => e.stopPropagation()}>
        <div className="flex justify-between items-center p-4 border-b border-lightest-navy/50">
          <h2 className="text-xl font-bold text-lightest-slate">Add New Media</h2>
          <button onClick={onClose} className="text-slate hover:text-white">
            <CloseIcon />
          </button>
        </div>
        
        <div className="p-6 space-y-4">
            <div>
                <label htmlFor="title" className="block text-sm font-medium text-light-slate">Title</label>
                <input
                    type="text"
                    id="title"
                    value={title}
                    onChange={(e) => setTitle(e.target.value)}
                    className="mt-1 w-full p-2 bg-navy border border-lightest-navy rounded-md focus:outline-none focus:ring-2 focus:ring-emerald text-lightest-slate"
                />
            </div>
            <div>
                <label htmlFor="mediaType" className="block text-sm font-medium text-light-slate">Media Type</label>
                <select
                    id="mediaType"
                    value={mediaType}
                    onChange={(e) => setMediaType(e.target.value as MediaType)}
                    className="mt-1 w-full p-2 bg-navy border border-lightest-navy rounded-md focus:outline-none focus:ring-2 focus:ring-emerald text-lightest-slate"
                >
                    {(Object.keys(MediaType) as Array<keyof typeof MediaType>).map(key => (
                        <option key={key} value={MediaType[key]}>{MediaType[key]}</option>
                    ))}
                </select>
            </div>
            <div>
                <label htmlFor="creator" className="block text-sm font-medium text-light-slate">{getCreatorLabel(mediaType)}</label>
                <input
                    type="text"
                    id="creator"
                    value={creator}
                    onChange={(e) => setCreator(e.target.value)}
                    className="mt-1 w-full p-2 bg-navy border border-lightest-navy rounded-md focus:outline-none focus:ring-2 focus:ring-emerald text-lightest-slate"
                />
            </div>
        </div>

        <div className="flex justify-end gap-4 p-4 border-t border-lightest-navy/50">
          <button onClick={onClose} className="px-4 py-2 rounded-md bg-lightest-navy text-lightest-slate hover:bg-slate">Cancel</button>
          <button 
            onClick={handleSubmit} 
            disabled={!title.trim() || !creator.trim()}
            className="px-6 py-2 rounded-md bg-emerald text-navy font-bold hover:bg-opacity-90 disabled:bg-slate disabled:cursor-not-allowed"
          >
            Create & Edit
          </button>
        </div>
      </div>
    </div>
  );
};

export default AddMediaModal;
