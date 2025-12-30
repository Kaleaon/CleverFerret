/**
 * Lazy Loading Image Component
 *
 * Optimized image component with lazy loading, placeholder, and error handling
 */

import React, { useState, useEffect, useRef } from 'react';
import { Box, Skeleton } from '@mui/material';

interface LazyImageProps {
  src: string;
  alt: string;
  width?: number | string;
  height?: number | string;
  fallbackSrc?: string;
  objectFit?: 'cover' | 'contain' | 'fill' | 'none' | 'scale-down';
  borderRadius?: number | string;
}

export const LazyImage: React.FC<LazyImageProps> = React.memo(
  ({ src, alt, width, height, fallbackSrc, objectFit = 'cover', borderRadius }) => {
    const [imageSrc, setImageSrc] = useState<string | null>(null);
    const [isLoading, setIsLoading] = useState(true);
    const [hasError, setHasError] = useState(false);
    const imgRef = useRef<HTMLImageElement>(null);

    useEffect(() => {
      setIsLoading(true);
      setHasError(false);
      setImageSrc(null);

      const observer = new IntersectionObserver(
        (entries) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              setImageSrc(src);
              observer.disconnect();
            }
          });
        },
        { rootMargin: '50px' },
      );

      if (imgRef.current) {
        observer.observe(imgRef.current);
      }

      return () => observer.disconnect();
    }, [src]);

    const handleLoad = () => {
      setIsLoading(false);
    };

    const handleError = () => {
      setIsLoading(false);
      setHasError(true);
      if (fallbackSrc) {
        setImageSrc(fallbackSrc);
      }
    };

    return (
      <Box
        ref={imgRef}
        sx={{
          width: width || '100%',
          height: height || '100%',
          position: 'relative',
          overflow: 'hidden',
          borderRadius: borderRadius || 0,
        }}
      >
        {isLoading && <Skeleton variant="rectangular" width="100%" height="100%" />}
        {imageSrc && (
          <img
            src={imageSrc}
            alt={alt}
            onLoad={handleLoad}
            onError={handleError}
            style={{
              width: '100%',
              height: '100%',
              objectFit,
              display: isLoading ? 'none' : 'block',
            }}
          />
        )}
      </Box>
    );
  },
);

LazyImage.displayName = 'LazyImage';
