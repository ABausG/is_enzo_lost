# Is [Enzo](https://x.com/enzoconty) lost?

A quick way of checking if [Enzo](https://x.com/enzoconty) is currently lost.


## Contribute

### Status update (recommended)

Open a [Status Update issue](https://github.com/ABausG/is_enzo_lost/issues/new?template=status-update.yml). Fill in:

- **Is Enzo lost** — Yes, No, or Maybe
- **Source** — link to the evidence (tweet, post, photo, …)
- **Description** — optional context shown on the site

A pull request is created automatically, reviewed by a code owner, and merged when approved. The issue is closed on merge.

### Manual update

You can still add an entry directly to [status.json](status.json):

```json
{
    "id": "string",
    "isLost": true,
    "source": "https://x.com/...",
    "description": "optional context",
    "timestamp": "2026-06-24T09:01:00.000Z"
}
```

- `isLost`: `true` = lost, `false` = not lost, `null` = maybe
- `id`: GitHub issue number for template submissions; legacy entries use commit-based slugs

Example:

```json
{
    "id": "42",
    "isLost": true,
    "source": "https://x.com/EnzoConty/status/1970090861309599888",
    "description": "Last seen in France",
    "timestamp": "2025-09-22T10:04:00.000Z"
}
```

## Disclaimer

Built in good spirit and in the hope that at the end of the journey I can spend time with Enzo.
