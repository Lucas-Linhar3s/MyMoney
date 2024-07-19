const host = '';
const initialRoute = "/";

const tableUser = '''
CREATE TABLE users (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT NOT NULL
);
''';

const tableCards = '''
CREATE TABLE cards (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  limite REAL NOT NULL
);
''';

const tableTransactions = '''
CREATE TABLE debts (
  id TEXT PRIMARY KEY,
  description TEXT NOT NULL,
  value REAL NOT NULL,
  parcels TEXT NOT NULL,
  is_paid INTEGER NOT NULL CHECK (is_paid IN (0, 1)),
  id_card TEXT NOT NULL,
  id_user TEXT NOT NULL,
  FOREIGN KEY (id_card) REFERENCES cards(id),
  FOREIGN KEY (id_user) REFERENCES users(id)
);

 ''';
