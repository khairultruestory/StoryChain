"use client";
import React, { useState } from 'react';
import { create } from 'ipfs-http-client';

// Create a new IPFS client
const client = create({ url: 'https://ipfs.infura.io:5001/api/v0' });

const EbookUploader = () => {
  const [selectedFile, setSelectedFile] = useState(null);
  const [uploading, setUploading] = useState(false);
  const [hash, setHash] = useState('');
  const [location, setLocation] = useState('');

  const handleFileChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setSelectedFile(event.target.files[0]);
  };

  const handleUpload = async () => {
    if (!selectedFile) return;

    setUploading(true);

    try {
      const result = await client.add(selectedFile);
      const hash = result.cid.toString();
      const location = `https://ipfs.infura.io/ipfs/${hash}`;

      setHash(hash);
      setLocation(location);
    } catch (error) {
      console.error(error);
    } finally {
      setUploading(false);
    }
  };

  return (
    <div>
      <h1>Ebook Uploader</h1>
      <input type="file" onChange={handleFileChange} />
      <button onClick={handleUpload} disabled={uploading}>
        {uploading ? 'Uploading...' : 'Upload'}
      </button>
      {hash && (
        <div>
          <h2>Upload Successful!</h2>
          <p>Hash: {hash}</p>
          <p>Location: {location}</p>
        </div>
      )}
    </div>
  );
};

export default EbookUploader;

