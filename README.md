# Contactbook

> A basic Contact Management App. 


## Features
- Work/Home Contact Info support
- CRUD Operations on the Contacts


## Widgets used
- `Form` for adding new contacts and editing existing ones
- `AppBar` for a top-bar across all pages
- `ListView` for All Contacts page (displaying all contacts in a scrollable view)
- `FloatingActionButton` for adding new contacts
- `BottomSheet` for addition modal (arbitrary choice, I could've used a separate screen as well)
- `SnackBar` for temporary messages
- `TextFormField` for validation in forms
- `Card` for Displaying Individual contacts in the All Contacts page
- `Column`s and `Row`s for granular and macro layouts
- `Icon` for relevant visual cues
- `InkWell` for buttons
- `Navigator` and `MaterialPageRoute` for navigation
- `Padding` for neat widget renders
- `CircularAvatar` and `AssetImage` for contact details page


## Todos

- [ ] Persistence using [`sqflite`](https://pub.dev/packages/sqflite)
- [ ] UI Embellishments (dividers in the forms, mostly)
- [ ] Favorites feature for easy contact access


## External Packages Used
- [`google\_fonts`](https://pub.dev/packages/google_fonts) for [Google Fonts](https://fonts.google.com/)
- [`uuid`](https://pub.dev/packages/uuid) for contact ids
- [`lorem\_ipsum`](https://pub.dev/packages/lorem_ipsum) for mock data (development)
