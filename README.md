# Flutter Messanger

#### This is a messenger app that I wrote to try out Firebase. In this app, you can search for people and correspond with them

The app consists of several parts: registration, a home screen with all user chats, a screen for searching for users, and a screen of a chat with a user.

* I implemented the **registration** part with Firebase Authentication. To register, you need to enter an email, password and name, and after the user is registered, part of his data (email and name) is stored in the Realtime Database. I also used Shared Preferences to store user data so that you don't have to log in every time you enter the app.

* The **home screen** contains all the user's chats, clicking on any of them will take you to the chat screen with the user. Also on this screen is a button to go to the screen with the search for users. On this screen, I used the db listening so that the chat data would be updated immediately if you received a message. If you have just registered, then obviously this screen will be empty.

* The **screen for searching** for users looks quite simple, there is a field where you need to enter the email of the user with whom you want to start a chat. The search works for all users by their emails.

* The **chat screen** with a user looks like a regular chat screen. This screen also uses a subscription to the database so that the screen is updated every time a new message appears.

For state management, I used the BLoC library, namely Cubit. I also used Dependency Injection pattern in the project.

### All libraries and tools used:

* BLoC
* Injector
* GetIt
* Injectable
* Firebase Core
* Firebase Auth
* Firebase Database
* Shared Preferences

## How to Use

### Step 1

Here is the link to clone the repository:

```
    https://github.com/matviizakrevskyi/Flutter-Messenger.git
```

### Step 2

Install dependencies:

```sh
    flutter pub get
```

### Step 3

Run code generation:

```sh
    flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Step 4

Launch the app:

```sh
    flutter run
```