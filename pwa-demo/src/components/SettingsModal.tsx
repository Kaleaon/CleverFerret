import React, { useState } from 'react';
import { useTheme } from '../contexts/ThemeContext';
import { themes, ThemeName } from '../themes';
import { CloseIcon, LoadingIcon } from './icons';
import { MediaItem } from '../types';
import { importCalibreDb } from '../services/calibreImporter';

interface SettingsModalProps {
  onClose: () => void;
  onImport: (items: MediaItem[]) => void;
}

const ThemeSwatch: React.FC<{ name: ThemeName }> = ({ name }) => {
  const { theme, setTheme } = useTheme();
  const palette = themes[name];
  const isSelected = theme === name;

  return (
    <div
      onClick={() => setTheme(name)}
      className={`cursor-pointer rounded-lg p-3 transition-all ${isSelected ? 'ring-2 ring-offset-2 ring-offset-light-navy ring-secondary' : 'ring-1 ring-lightest-navy/20 hover:ring-slate'}`}
    >
      <div className="flex gap-2 h-16 rounded-md overflow-hidden mb-2">
        <div style={{ backgroundColor: `hsl(${palette.background})` }} className="w-1/4"></div>
        <div style={{ backgroundColor: `hsl(${palette.surface})` }} className="w-1/4"></div>
        <div style={{ backgroundColor: `hsl(${palette.primary})` }} className="w-1/4"></div>
        <div style={{ backgroundColor: `hsl(${palette.secondary})` }} className="w-1/4"></div>
      </div>
      <p className={`text-sm text-center ${isSelected ? 'text-secondary font-bold' : 'text-light-slate'}`}>{name}</p>
    </div>
  );
};

const SettingsModal: React.FC<SettingsModalProps> = ({ onClose, onImport }) => {
  const { availableThemes } = useTheme();
  const [importFile, setImportFile] = useState<File | null>(null);
  const [isImporting, setIsImporting] = useState(false);
  const [importMessage, setImportMessage] = useState<{ type: 'success' | 'error', text: string } | null>(null);

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files.length > 0) {
      setImportFile(e.target.files[0]);
      setImportMessage(null);
    }
  };

  const handleImport = async () => {
    if (!importFile) return;

    setIsImporting(true);
    setImportMessage(null);
    try {
      const newItems = await importCalibreDb(importFile);
      onImport(newItems);
      setImportMessage({ type: 'success', text: `Successfully imported ${newItems.length} books.` });
      setImportFile(null); 
    } catch (err: any) {
      setImportMessage({ type: 'error', text: err.message || 'Failed to import library.' });
    } finally {
      setIsImporting(false);
    }
  };


  return (
    <div className="fixed inset-0 bg-black bg-opacity-75 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-light-navy w-full max-w-4xl max-h-[90vh] rounded-lg shadow-xl flex flex-col" onClick={(e) => e.stopPropagation()}>
        <div className="flex justify-between items-center p-4 border-b border-lightest-navy/50">
          <h2 className="text-xl font-bold text-lightest-slate">Settings</h2>
          <button onClick={onClose} className="text-slate hover:text-white">
            <CloseIcon />
          </button>
        </div>
        
        <div className="flex-grow overflow-y-auto p-6">
          <section>
            <h3 className="text-lg font-semibold text-light-slate mb-4">Application Theme</h3>
            <p className="text-sm text-slate mb-6">Select a theme to change the application's appearance. Your choice will be saved for your next visit.</p>
            <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4">
              {availableThemes.map(name => (
                <ThemeSwatch key={name} name={name} />
              ))}
            </div>
          </section>

          <div className="border-t border-lightest-navy/50 my-8"></div>

          <section>
            <h3 className="text-lg font-semibold text-light-slate mb-4">Import Library</h3>
            <p className="text-sm text-slate mb-6">Import your book library from Calibre by selecting your <code className="bg-navy px-1 py-0.5 rounded text-xs text-emerald">metadata.db</code> file. Existing items with the same title and author will be skipped.</p>
            
            <div className="flex flex-col sm:flex-row items-start sm:items-center gap-4">
               <label className="block">
                  <span className="sr-only">Choose database file</span>
                  <input type="file" onChange={handleFileChange} accept=".db" className="block w-full text-sm text-slate
                    file:mr-4 file:py-2 file:px-4
                    file:rounded-full file:border-0
                    file:text-sm file:font-semibold
                    file:bg-emerald file:text-navy
                    hover:file:bg-opacity-90"
                  />
              </label>
              <button
                onClick={handleImport}
                disabled={!importFile || isImporting}
                className="flex items-center justify-center gap-2 bg-emerald text-navy font-bold py-2 px-4 rounded-md hover:bg-opacity-90 transition-colors disabled:bg-slate disabled:cursor-not-allowed"
              >
                {isImporting ? <LoadingIcon className="w-5 h-5" /> : null}
                <span>{isImporting ? 'Importing...' : 'Import'}</span>
              </button>
            </div>
             {importMessage && (
              <p className={`mt-4 text-sm ${importMessage.type === 'success' ? 'text-emerald' : 'text-red-400'}`}>
                {importMessage.text}
              </p>
            )}
          </section>
        </div>
      </div>
    </div>
  );
};

export default SettingsModal;