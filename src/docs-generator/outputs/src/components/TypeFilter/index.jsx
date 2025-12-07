import React, { useState, useEffect } from 'react';
import styles from './styles.module.css';

const TYPE_LABELS = {
  function: '🔧 Functions',
  object: '📦 Objects',
  primitive: '🔤 Primitives',
  array: '📊 Arrays',
  class: '🏛️ Classes',
  'global-ref': '🔗 Global Refs',
  other: '❓ Other',
};

const TYPE_DESCRIPTIONS = {
  function: 'Callable methods and functions',
  object: 'Tables, class instances, and objects',
  primitive: 'Strings, numbers, booleans, nil',
  array: 'Array structures with length info',
  class: 'Named class types',
  'global-ref': 'References to other globals',
  other: 'Uncategorized types',
};

export default function TypeFilter({ fieldTypes = {} }) {
  const [activeFilters, setActiveFilters] = useState(new Set());
  const [excludeMode, setExcludeMode] = useState(false);
  const [isSticky, setIsSticky] = useState(false);

  // Available types (only show types that exist in current document)
  const availableTypes = Object.keys(fieldTypes).sort();

  useEffect(() => {
    // Apply filters
    const fields = document.querySelectorAll('[data-field-type]');

    fields.forEach((field) => {
      const fieldType = field.getAttribute('data-field-type');
      let shouldShow = true;

      if (activeFilters.size > 0) {
        if (excludeMode) {
          // Exclude mode: hide if type is in active filters
          shouldShow = !activeFilters.has(fieldType);
        } else {
          // Include mode: show only if type is in active filters
          shouldShow = activeFilters.has(fieldType);
        }
      }

      // Get parent <li> element
      const listItem = field.closest('li');
      if (listItem) {
        listItem.style.display = shouldShow ? '' : 'none';
      }
    });

    // Update counts
    updateVisibleCounts();
  }, [activeFilters, excludeMode]);

  // Handle scroll to make filter sticky
  useEffect(() => {
    const handleScroll = () => {
      setIsSticky(window.scrollY > 200);
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const updateVisibleCounts = () => {
    const totalFields = document.querySelectorAll('[data-field-type]').length;
    const visibleFields = document.querySelectorAll('[data-field-type]').length;

    let hiddenCount = 0;
    document.querySelectorAll('[data-field-type]').forEach((field) => {
      const listItem = field.closest('li');
      if (listItem && listItem.style.display === 'none') {
        hiddenCount++;
      }
    });

    const countElement = document.getElementById('filter-count');
    if (countElement) {
      const visibleCount = totalFields - hiddenCount;
      countElement.textContent = `Showing ${visibleCount} of ${totalFields} fields`;
    }
  };

  const toggleFilter = (type) => {
    setActiveFilters((prev) => {
      const newFilters = new Set(prev);
      if (newFilters.has(type)) {
        newFilters.delete(type);
      } else {
        newFilters.add(type);
      }
      return newFilters;
    });
  };

  const clearFilters = () => {
    setActiveFilters(new Set());
  };

  const selectAll = () => {
    setActiveFilters(new Set(availableTypes));
  };

  if (availableTypes.length === 0) {
    return null; // No types to filter
  }

  return (
    <div className={`${styles.typeFilter} ${isSticky ? styles.sticky : ''}`}>
      <div className={styles.header}>
        <h3 className={styles.title}>🔍 Filter by Type</h3>
        <div className={styles.controls}>
          <label className={styles.modeToggle}>
            <input
              type="checkbox"
              checked={excludeMode}
              onChange={(e) => setExcludeMode(e.target.checked)}
            />
            <span>{excludeMode ? '❌ Exclude Mode' : '✅ Include Mode'}</span>
          </label>
          <button onClick={clearFilters} className={styles.clearBtn} title="Clear all filters">
            Clear
          </button>
          <button onClick={selectAll} className={styles.selectAllBtn} title="Select all types">
            Select All
          </button>
        </div>
      </div>

      <div className={styles.typeGrid}>
        {availableTypes.map((type) => {
          const isActive = activeFilters.has(type);
          const count = fieldTypes[type] || 0;
          const label = TYPE_LABELS[type] || type;
          const description = TYPE_DESCRIPTIONS[type] || '';

          return (
            <button
              key={type}
              onClick={() => toggleFilter(type)}
              className={`${styles.typeButton} ${isActive ? styles.active : ''}`}
              title={description}
            >
              <span className={styles.typeLabel}>{label}</span>
              <span className={styles.typeCount}>{count}</span>
            </button>
          );
        })}
      </div>

      <div className={styles.footer}>
        <div id="filter-count" className={styles.count}>
          {activeFilters.size === 0
            ? `All types visible (${Object.values(fieldTypes).reduce((a, b) => a + b, 0)} fields)`
            : 'Filtering...'}
        </div>
        {activeFilters.size > 0 && (
          <div className={styles.activeFilters}>
            Active: {Array.from(activeFilters).map((t) => TYPE_LABELS[t] || t).join(', ')}
          </div>
        )}
      </div>
    </div>
  );
}
