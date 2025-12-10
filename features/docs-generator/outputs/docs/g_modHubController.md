---
title: g_modHubController
description: Global g_modHubController - Runtime introspected API
fieldTypes:
  function: 90
  "global-ref": 2
  object: 17
  primitive: 4267
---

import TypeFilter from '@site/src/components/TypeFilter';

# g_modHubController

Runtime-introspected API for `g_modHubController`.

**Source**: session_2025_11_10_01 (depth 3)  
**Fields**: 53 top-level fields

<TypeFilter fieldTypes={{
  function: 90,
  "global-ref": 2,
  object: 17,
  primitive: 4267,
}} />

## Overview

The `g_modHubController` global contains the following structure:

## Fields

- <span data-field-type="function">**userProfileChanged**: `function`</span>
- <span data-field-type="function">**getModsByCategory**: `function`</span>
- <span data-field-type="function">**getModInfo**: `function`</span>
- <span data-field-type="function">**getPostFix**: `function`</span>
- <span data-field-type="function">**getDependendMods**: `function`</span>
- <span data-field-type="function">**update**: `function`</span>
- <span data-field-type="function">**isa**: `function`</span>
- <span data-field-type="function">**isCategorySearchable**: `function`</span>
- <span data-field-type="function">**searchInCategory**: `function`</span>
- <span data-field-type="function">**reset**: `function`</span>
- <span data-field-type="function">**reload**: `function`</span>
- <span data-field-type="function">**getCategories**: `function`</span>
- <span data-field-type="function">**searchMods**: `function`</span>
- <span data-field-type="function">**setShowAllMods**: `function`</span>
- <span data-field-type="function">**getVote**: `function`</span>
- <span data-field-type="function">**load**: `function`</span>
- <span data-field-type="function">**vote**: `function`</span>
- <span data-field-type="function">**setDiscSpaceChangedCallback**: `function`</span>
- <span data-field-type="function">**setUninstalledCallback**: `function`</span>
- <span data-field-type="function">**setUninstallFailedCallback**: `function`</span>
- <span data-field-type="function">**uninstall**: `function`</span>
- <span data-field-type="function">**superClass**: `function`</span>
- <span data-field-type="function">**copy**: `function`</span>
- <span data-field-type="function">**class**: `function`</span>
- <span data-field-type="function">**install**: `function`</span>
- <span data-field-type="function">**isContestEnabled**: `function`</span>
- <span data-field-type="function">**getTotalModSpaceKb**: `function`</span>
- <span data-field-type="function">**getUsedModSpaceKb**: `function`</span>
- <span data-field-type="function">**getFreeModSpaceKb**: `function`</span>
- <span data-field-type="function">**getTotalFilesizeKb**: `function`</span>
- <span data-field-type="function">**getVisibleCategories**: `function`</span>
- <span data-field-type="function">**endModification**: `function`</span>
- <span data-field-type="function">**startModification**: `function`</span>
- <span data-field-type="function">**new**: `function`</span>
- <span data-field-type="function">**updateRecommendationSystem**: `function`</span>
- <span data-field-type="function">**generateSearchScore**: `function`</span>
- <span data-field-type="function">**setVotedCallback**: `function`</span>
- <span data-field-type="function">**getCategoryData**: `function`</span>
- <span data-field-type="function">**getCategory**: `function`</span>
- <span data-field-type="function">**setModInstallFailedCallback**: `function`</span>
- <span data-field-type="function">**loadCategoriesFromXML**: `function`</span>
- <span data-field-type="function">**setDependendModIstallFailedCallback**: `function`</span>
- <span data-field-type="function">**setAddedToDownloadCallback**: `function`</span>
- <span data-field-type="primitive">**hasChanges**: `boolean`</span>
- <span data-field-type="global-ref">**gameSettings**: `global-ref` → [`g_gameSettings`](../globals/g_gameSettings.md)</span>
- <span data-field-type="object">**categories**: `table`</span>
- <span data-field-type="object">**priceMapping**: `table`</span>
  - <span data-field-type="primitive">**br**: `string`</span>
  - <span data-field-type="primitive">**cs**: `string`</span>
  - <span data-field-type="primitive">**ct**: `string`</span>
  - <span data-field-type="primitive">**cz**: `string`</span>
  - <span data-field-type="primitive">**da**: `string`</span>
  - <span data-field-type="primitive">**de**: `string`</span>
  - <span data-field-type="primitive">**ea**: `string`</span>
  - <span data-field-type="primitive">**en**: `string`</span>
  - <span data-field-type="primitive">**es**: `string`</span>
  - <span data-field-type="primitive">**fc**: `string`</span>
  - <span data-field-type="primitive">**fi**: `string`</span>
  - <span data-field-type="primitive">**fr**: `string`</span>
  - <span data-field-type="primitive">**hu**: `string`</span>
  - <span data-field-type="primitive">**it**: `string`</span>
  - <span data-field-type="primitive">**jp**: `string`</span>
  - *...and 9 more fields*
- <span data-field-type="primitive">**hasTriggedUUIDInEngine**: `boolean`</span>
- <span data-field-type="object">**categoryNameMapping**: `table`</span>
- <span data-field-type="object">**modIdToInfo**: `table`</span>

*...and 3 more top-level fields*

## Usage Example

```lua
-- Access g_modHubController fields
```
