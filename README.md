# sp_flutter_app

## Software Architecture

![Architecture Diagram](https://i.ibb.co/3NFkZk0/Software-Architecture.png)

## Software Architecture Explained

### View

We will have various screens in the app that need to display certain Views. The Views are just Flutter widgets that show a certain part of the app. Each View will be Flutter widgets that depend on and use a certain ViewModel for displaying data and responding to user actions.

### Model

The model, as we've seen, is just a way of encapsulating and representing our data in the app. This data is coming from Firebase. These classes can have helper methods for parsing or formatting data, but they are meant to stand alone and not depend on anything else.

### ViewModel

The ViewModel is very important in this architecture. The purpose of the ViewModel is to model the data for a particular View.
Therefore, the ViewModel depends on Models because we will use the Models to represent data from the database.
Also, in the class definition of the ViewModel we will extend the ChangeNotifier class from the Provider package. This allows us to call a special function notifyListeners() when we need to tell the UI (View) that the data has changed (then the UI will update).
Lastly, the ViewModel depends on and interacts with the Service / API classes to call methods that query the database and more.

### Service / API Class

The Service / API Class is just a class that establishes a singleton instance of a Firebase service and creates useful methods for interacting with Firebase Services.
We need this to not handle the data for use via Models, but rather pass the raw data back to the ViewModel so that the ViewModel can take the data from Firebase and map it to a Model.

## File Structure

```
lib
  ├── views                     # View classes for UI
  |
  ├── viewmodels                # ViewModels for handling state (data via Models) and interactions with the API
  |
  ├── models                    # Model classes           
  |
  ├── services                  # Services (APIs) that interact with Firebase services
  |
  ├── shared                    # Shared components and constants
  |
  └── main.dart              
```

## Study Material for Software Architecture

This is for understanding more of the concepts. This is not necessarily exactly how we will do things, but don't disregard this either. These are all good articles that might or might not take different approaches to the same architecture.

- https://medium.com/@chhimpa.shubh04/flutter-mvvm-providers-9a0fd66b7607
- https://medium.com/better-programming/mvvm-in-flutter-edd212fd767a
- https://levelup.gitconnected.com/state-management-in-flutter-using-provider-1dc2a8e9f2b1

## Getting Started with Flutter

Official Flutter documentation:

- [Installing Flutter](https://flutter.dev/docs/get-started/install)
- [Setup VS Code](https://flutter.dev/docs/get-started/editor?tab=vscode)
