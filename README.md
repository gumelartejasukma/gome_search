[![pub package](https://img.shields.io/pub/v/gome_serach.svg)](https://pub.dev/packages/gome_serach)

# gome_search

A lightweight and reusable search input field with:

- Debounce search (default 500ms)
- Clear button
- Search icon
- Initial value support

## Usage

```dart
Search(
  placeholder: 'Cari produk',
  onSearchChanged: (text) {
    print('Search: $text');
  },
)
```
