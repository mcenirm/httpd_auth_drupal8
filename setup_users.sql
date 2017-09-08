CREATE TABLE IF NOT EXISTS authn (
    username VARCHAR(80) PRIMARY KEY,
    password VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS authz (
    groupname VARCHAR(80) NOT NULL,
    username VARCHAR(80) NOT NULL
        REFERENCES authn (username)
        ON DELETE CASCADE,
    UNIQUE(groupname, username)
);


INSERT INTO authn (username, password) VALUES
    ('user1', '$2y$05$5wpKCSAVkw/0R6jm9nCx8e2k8yduYn4oHRgSopnhKW/70BTefIJ3q'),
    ('user2', '$2y$05$/Bn3WchL0vwwqHBBq8NdbOgiS8uW7c2/8Av6sf.O2uyF6xMcjcUGa');

INSERT INTO authz (groupname, username) VALUES
    ('team1', 'user1'),
    ('team2', 'user2');
