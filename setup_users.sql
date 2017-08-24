-- http://www.proftpd.org/docs/howto/SQL.html

  CREATE TABLE IF NOT EXISTS users (
    userid VARCHAR(30) NOT NULL UNIQUE,
    passwd VARCHAR(80) NOT NULL,
    uid INTEGER UNIQUE,
    gid INTEGER,
    homedir VARCHAR(255),
    shell VARCHAR(255)
  );

  CREATE INDEX IF NOT EXISTS users_userid_idx ON users (userid);

  CREATE TABLE IF NOT EXISTS groups (
    groupname VARCHAR(30) NOT NULL,
    gid INTEGER NOT NULL,
    members VARCHAR(255)
  );

  CREATE INDEX IF NOT EXISTS groups_gid_idx ON groups (gid);

INSERT INTO groups (groupname, gid, members) VALUES
    ('team1', 200001, 'user1'),
    ('team2', 200002, 'user2');
INSERT INTO users (userid, passwd, uid, gid, homedir, shell) VALUES
    ('user1', '$5$Wt0eMkY23yPbozVg$/sFqS7X21GatnLT6Li3CBMfXK0islyHRpkjG13D2Xz6', 100001, 100001, '/ftp', '/usr/sbin/nologin'),
    ('user2', '$5$l9pYOVqKYTpUqWxq$2lNHOtghOU3KsS2MuTbe6iY2EFOO0ICMRzHFNSS4Ga9', 100002, 100002, '/ftp', '/usr/sbin/nologin');
