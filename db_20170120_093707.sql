------------- SQLite3 Dump File -------------

-- ------------------------------------------
-- Dump of "auth_group"
-- ------------------------------------------

DROP TABLE IF EXISTS "auth_group";

CREATE TABLE "auth_group"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name" Text NOT NULL,
CONSTRAINT "unique_name" UNIQUE ( "name" ) );


-- ------------------------------------------
-- Dump of "auth_group_permissions"
-- ------------------------------------------

DROP TABLE IF EXISTS "auth_group_permissions";

CREATE TABLE "auth_group_permissions"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id" Integer NOT NULL,
	"permission_id" Integer NOT NULL,
	CONSTRAINT "auth_group_permissions_auth_group_NO ACTION_NO ACTION_group_id_id_0" FOREIGN KEY ( "group_id" ) REFERENCES "auth_group"( "id" )
,
	CONSTRAINT "auth_group_permissions_auth_permission_NO ACTION_NO ACTION_permission_id_id_0" FOREIGN KEY ( "permission_id" ) REFERENCES "auth_permission"( "id" )
 );

CREATE INDEX "auth_group_permissions_0e939a4f" ON "auth_group_permissions"( "group_id" );
CREATE INDEX "auth_group_permissions_8373b171" ON "auth_group_permissions"( "permission_id" );
CREATE UNIQUE INDEX "auth_group_permissions_group_id_0cd325b0_uniq" ON "auth_group_permissions"( "group_id", "permission_id" );

-- ------------------------------------------
-- Dump of "auth_permission"
-- ------------------------------------------

DROP TABLE IF EXISTS "auth_permission";

CREATE TABLE "auth_permission"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id" Integer NOT NULL,
	"codename" Text NOT NULL,
	"name" Text NOT NULL,
	CONSTRAINT "auth_permission_django_content_type_NO ACTION_NO ACTION_content_type_id_id_0" FOREIGN KEY ( "content_type_id" ) REFERENCES "django_content_type"( "id" )
 );

CREATE INDEX "auth_permission_417f1b1c" ON "auth_permission"( "content_type_id" );
CREATE UNIQUE INDEX "auth_permission_content_type_id_01ab375a_uniq" ON "auth_permission"( "content_type_id", "codename" );

BEGIN;

INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 1,1,'add_logentry','Can add log entry' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 2,1,'change_logentry','Can change log entry' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 3,1,'delete_logentry','Can delete log entry' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 4,2,'add_permission','Can add permission' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 5,2,'change_permission','Can change permission' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 6,2,'delete_permission','Can delete permission' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 7,3,'add_group','Can add group' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 8,3,'change_group','Can change group' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 9,3,'delete_group','Can delete group' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 10,4,'add_user','Can add user' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 11,4,'change_user','Can change user' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 12,4,'delete_user','Can delete user' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 13,5,'add_contenttype','Can add content type' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 14,5,'change_contenttype','Can change content type' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 15,5,'delete_contenttype','Can delete content type' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 16,6,'add_session','Can add session' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 17,6,'change_session','Can change session' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 18,6,'delete_session','Can delete session' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 19,7,'add_person','Can add Пользователи' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 20,7,'change_person','Can change Пользователи' );
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES ( 21,7,'delete_person','Can delete Пользователи' );




COMMIT;

-- ------------------------------------------
-- Dump of "auth_user"
-- ------------------------------------------

DROP TABLE IF EXISTS "auth_user";

CREATE TABLE "auth_user"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password" Text NOT NULL,
	"last_login" Numeric,
	"is_superuser" Numeric NOT NULL,
	"first_name" Text NOT NULL,
	"last_name" Text NOT NULL,
	"email" Text NOT NULL,
	"is_staff" Numeric NOT NULL,
	"is_active" Numeric NOT NULL,
	"date_joined" DateTime NOT NULL,
	"username" Text NOT NULL,
CONSTRAINT "unique_username" UNIQUE ( "username" ) );


BEGIN;

INSERT INTO "auth_user" ("id","password","last_login","is_superuser","first_name","last_name","email","is_staff","is_active","date_joined","username") VALUES ( 1,'pbkdf2_sha256$24000$bECV205GaYTy$MHwBOfPakiNw99+bAchy8CXb/fZ8hTK5qDdoHflGX/U=','2017-01-17 16:49:46.357641',1,'','','nipo777@i.ua',1,1,'2016-12-29 17:09:23.782250','Administrator' );
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","first_name","last_name","email","is_staff","is_active","date_joined","username") VALUES ( 13,'pbkdf2_sha256$24000$XMEP9XsFV7uv$L2yrpdkZAnSX0epxkluuONt7J79VYDwF2ZsL3InaG00=','2017-01-19 20:41:58.491838',0,'A','Smith','superagent@gmail.com',0,1,'2017-01-05 14:31:50.003811','superagent' );
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","first_name","last_name","email","is_staff","is_active","date_joined","username") VALUES ( 30,'pbkdf2_sha256$24000$On6BOXorjsem$U60h0Ee/M02vnCALiEHrWYwUh+PC2GYtXk7Xnio/0M8=','2017-01-17 17:11:45.180948',0,'Javaharlal','Neru','jn@i.ua',0,1,'2017-01-17 17:11:44.597915','javaharlalneru' );
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","first_name","last_name","email","is_staff","is_active","date_joined","username") VALUES ( 37,'pbkdf2_sha256$24000$Vj9AUODOj3L5$wNiX0ifZqD/UNixz6czLtF0z1f9BpaB2vaS8Pas8S00=','2017-01-19 16:38:55.021711',0,'Phillip','Coulson','pk@gmail.com',1,1,'2017-01-19 15:04:14','phillcoulson' );
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","first_name","last_name","email","is_staff","is_active","date_joined","username") VALUES ( 38,'pbkdf2_sha256$24000$FbO06Q3UJ88V$GRglHBb4OQR/BU4YizsCIrwvPmLgQnKvfZOm/tDLCek=','2017-01-19 16:39:48.465768',0,'Melinda','May','mm@google.com',0,1,'2017-01-19 15:46:10.430707','melindamay' );
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","first_name","last_name","email","is_staff","is_active","date_joined","username") VALUES ( 40,'pbkdf2_sha256$24000$iMl9lfj5NCZz$pjRsAQKlFC2b/7nfaerblHtZBcIi4rZ1zlXD805Bvmg=','2017-01-19 16:33:32.627271',0,'Daisy','Johnson','skye@shield.com',0,1,'2017-01-19 16:03:26.267953','daisyjohnson' );
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","first_name","last_name","email","is_staff","is_active","date_joined","username") VALUES ( 41,'pbkdf2_sha256$24000$etF9qKrij6O9$M4VUd0ACuVcfGJ+Awq9BngK+UGk2dFaESSeIH9gSi1k=','2017-01-19 16:48:20.894077',0,'James','Bond','',0,1,'2017-01-19 16:24:03.588724','jamesbond' );
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","first_name","last_name","email","is_staff","is_active","date_joined","username") VALUES ( 42,'pbkdf2_sha256$24000$7kLaS5k6wcF9$kcQnum58hPfzlXdNHh2YK5hAttp2fbBw4gPo+ZpLYXk=','2017-01-19 16:40:44.568977',0,'Jemma','Simmons','js@shield.com',0,1,'2017-01-19 16:27:31.975643','jemmasimmons' );
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","first_name","last_name","email","is_staff","is_active","date_joined","username") VALUES ( 43,'pbkdf2_sha256$24000$PuABAXzfM34C$x6bmg5VKnoYO8y/b3lJn7uZPjLNjuecTjgOPF++yOiY=','2017-01-19 16:46:27.615598',0,'Leopold','Fitz','lf@i.us',0,1,'2017-01-19 16:30:05.858444','leopoldfitz' );




COMMIT;

-- ------------------------------------------
-- Dump of "auth_user_groups"
-- ------------------------------------------

DROP TABLE IF EXISTS "auth_user_groups";

CREATE TABLE "auth_user_groups"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id" Integer NOT NULL,
	"group_id" Integer NOT NULL,
	CONSTRAINT "auth_user_groups_auth_user_NO ACTION_NO ACTION_user_id_id_0" FOREIGN KEY ( "user_id" ) REFERENCES "auth_user"( "id" )
,
	CONSTRAINT "auth_user_groups_auth_group_NO ACTION_NO ACTION_group_id_id_0" FOREIGN KEY ( "group_id" ) REFERENCES "auth_group"( "id" )
 );

CREATE INDEX "auth_user_groups_0e939a4f" ON "auth_user_groups"( "group_id" );
CREATE INDEX "auth_user_groups_e8701ad4" ON "auth_user_groups"( "user_id" );
CREATE UNIQUE INDEX "auth_user_groups_user_id_94350c0c_uniq" ON "auth_user_groups"( "user_id", "group_id" );

-- ------------------------------------------
-- Dump of "auth_user_user_permissions"
-- ------------------------------------------

DROP TABLE IF EXISTS "auth_user_user_permissions";

CREATE TABLE "auth_user_user_permissions"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id" Integer NOT NULL,
	"permission_id" Integer NOT NULL,
	CONSTRAINT "auth_user_user_permissions_auth_user_NO ACTION_NO ACTION_user_id_id_0" FOREIGN KEY ( "user_id" ) REFERENCES "auth_user"( "id" )
,
	CONSTRAINT "auth_user_user_permissions_auth_permission_NO ACTION_NO ACTION_permission_id_id_0" FOREIGN KEY ( "permission_id" ) REFERENCES "auth_permission"( "id" )
 );

CREATE INDEX "auth_user_user_permissions_8373b171" ON "auth_user_user_permissions"( "permission_id" );
CREATE INDEX "auth_user_user_permissions_e8701ad4" ON "auth_user_user_permissions"( "user_id" );
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_14a6b632_uniq" ON "auth_user_user_permissions"( "user_id", "permission_id" );

BEGIN;

INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 1,37,4 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 2,37,5 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 3,37,6 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 4,37,7 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 5,37,8 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 6,37,9 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 7,37,10 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 8,37,11 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 9,37,12 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 10,37,19 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 11,37,20 );
INSERT INTO "auth_user_user_permissions" ("id","user_id","permission_id") VALUES ( 12,37,21 );




COMMIT;

-- ------------------------------------------
-- Dump of "django_admin_log"
-- ------------------------------------------

DROP TABLE IF EXISTS "django_admin_log";

CREATE TABLE "django_admin_log"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"object_id" Text,
	"object_repr" Text NOT NULL,
	"action_flag" Integer NOT NULL,
	"change_message" Text NOT NULL,
	"content_type_id" Integer,
	"user_id" Integer NOT NULL,
	"action_time" DateTime NOT NULL,
	CONSTRAINT "django_admin_log_django_content_type_NO ACTION_NO ACTION_content_type_id_id_0" FOREIGN KEY ( "content_type_id" ) REFERENCES "django_content_type"( "id" )
,
	CONSTRAINT "django_admin_log_auth_user_NO ACTION_NO ACTION_user_id_id_0" FOREIGN KEY ( "user_id" ) REFERENCES "auth_user"( "id" )
 );

CREATE INDEX "django_admin_log_417f1b1c" ON "django_admin_log"( "content_type_id" );
CREATE INDEX "django_admin_log_e8701ad4" ON "django_admin_log"( "user_id" );

BEGIN;

INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 1,'2','tester',1,'Added.',4,1,'2016-12-29 22:02:14.188220' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 2,'2','tester',2,'Changed first_name, last_name, email and last_login.',4,1,'2016-12-29 22:03:04.001069' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 3,'1','tester',1,'Added.',7,1,'2016-12-29 22:06:05.330440' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 4,'3','retester',1,'Added.',4,1,'2017-01-01 17:06:49.625968' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 5,'3','retester',2,'Changed first_name, last_name and email.',4,1,'2017-01-01 17:07:36.647658' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 6,'2','retester',3,'',7,1,'2017-01-01 17:13:37.249283' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 7,'3','retester',3,'',7,1,'2017-01-01 17:20:09.623726' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 8,'4','retester',3,'',7,1,'2017-01-01 17:46:02.823564' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 9,'5','retester',3,'',7,1,'2017-01-01 19:12:59.694952' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 10,'6','retester',2,'Changed photo.',7,1,'2017-01-01 19:18:50.700028' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 11,'6','retester',2,'Changed photo.',7,1,'2017-01-01 19:19:50.234433' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 12,'2','tester',2,'Changed is_staff.',4,1,'2017-01-02 17:02:49.859132' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 13,'2','tester',2,'Changed password.',4,1,'2017-01-02 17:03:21.610948' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 14,'2','tester',2,'No fields changed.',4,1,'2017-01-02 17:03:30.508457' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 15,'4','ratauy',3,'',4,1,'2017-01-09 13:32:35.068033' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 16,'5','twister',3,'',4,1,'2017-01-09 13:32:35.193040' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 17,'16','nedstark',3,'',4,1,'2017-01-09 14:43:49.304505' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 18,'17','nedstark',3,'',4,1,'2017-01-09 15:02:22.974204' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 19,'2','ikhmongol',2,'Changed password.',4,1,'2017-01-14 15:32:57.959213' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 20,'7','agent007',2,'Changed password.',4,1,'2017-01-14 15:33:56.948587' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 21,'2','ikhmongol',2,'Changed password.',4,1,'2017-01-14 15:59:28.520847' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 22,'2','ikhmongol',2,'Changed password.',4,1,'2017-01-14 20:54:46.830841' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 23,'24','habrbabr',3,'',4,1,'2017-01-17 16:50:49.371753' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 24,'26','javaharlalneru',3,'',4,1,'2017-01-17 16:50:49.559764' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 25,'22','retester',3,'',4,1,'2017-01-17 16:50:49.691771' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 26,'23','retseter',3,'',4,1,'2017-01-17 16:50:49.835779' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 27,'21','tester',3,'',4,1,'2017-01-17 16:50:49.968787' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 28,'27','radjivghandi',3,'',4,1,'2017-01-17 16:58:06.649754' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 29,'28','javaharlalneru',3,'',4,1,'2017-01-17 17:02:31.954191' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 30,'29','javaharlalneru',3,'',4,1,'2017-01-17 17:11:09.022243' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 31,'31','superagent000',3,'',4,1,'2017-01-17 20:16:55.416418' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 32,'32','rarara',3,'',4,1,'2017-01-17 20:41:30.182769' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 33,'33','rarara',3,'',4,1,'2017-01-17 20:56:17.041495' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 34,'34','rarara',3,'',4,1,'2017-01-17 21:08:18.257746' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 35,'36','phillcoulson',3,'',4,1,'2017-01-19 15:03:30.051261' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 36,'37','phillcoulson',2,'Changed is_staff and user_permissions.',4,1,'2017-01-19 15:29:42.092177' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 37,'35','rarara',3,'',4,1,'2017-01-19 15:42:49.118192' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 38,'39','daisyjohnson',3,'',4,1,'2017-01-19 16:00:59.018531' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 39,'3','edited',3,'',4,1,'2017-01-19 16:15:43.982148' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 40,'2','ikhmongol',3,'',4,1,'2017-01-19 16:15:44.487177' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 41,'15','jameshatfield',3,'',4,1,'2017-01-19 16:15:44.640185' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 42,'14','johnthornsmith',3,'',4,1,'2017-01-19 16:15:44.772193' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 43,'19','josyaaronstein',3,'',4,1,'2017-01-19 16:15:44.893200' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 44,'25','mhershallaali',3,'',4,1,'2017-01-19 16:15:45.026208' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 45,'8','mr_Andersson',3,'',4,1,'2017-01-19 16:15:45.148215' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 46,'18','nedstark',3,'',4,1,'2017-01-19 16:15:45.285222' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 47,'20','smithadamson',3,'',4,1,'2017-01-19 16:15:45.426230' );
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES ( 48,'7','jamesbond',3,'',4,1,'2017-01-19 16:22:41.131007' );




COMMIT;

-- ------------------------------------------
-- Dump of "django_content_type"
-- ------------------------------------------

DROP TABLE IF EXISTS "django_content_type";

CREATE TABLE "django_content_type"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label" Text NOT NULL,
	"model" Text NOT NULL );

CREATE UNIQUE INDEX "django_content_type_app_label_76bd3d3b_uniq" ON "django_content_type"( "app_label", "model" );

BEGIN;

INSERT INTO "django_content_type" ("id","app_label","model") VALUES ( 1,'admin','logentry' );
INSERT INTO "django_content_type" ("id","app_label","model") VALUES ( 2,'auth','permission' );
INSERT INTO "django_content_type" ("id","app_label","model") VALUES ( 3,'auth','group' );
INSERT INTO "django_content_type" ("id","app_label","model") VALUES ( 4,'auth','user' );
INSERT INTO "django_content_type" ("id","app_label","model") VALUES ( 5,'contenttypes','contenttype' );
INSERT INTO "django_content_type" ("id","app_label","model") VALUES ( 6,'sessions','session' );
INSERT INTO "django_content_type" ("id","app_label","model") VALUES ( 7,'personal','person' );




COMMIT;

-- ------------------------------------------
-- Dump of "django_migrations"
-- ------------------------------------------

DROP TABLE IF EXISTS "django_migrations";

CREATE TABLE "django_migrations"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app" Text NOT NULL,
	"name" Text NOT NULL,
	"applied" DateTime NOT NULL );


BEGIN;

INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 1,'contenttypes','0001_initial','2016-12-29 17:08:24.605865' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 2,'auth','0001_initial','2016-12-29 17:08:24.940884' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 3,'admin','0001_initial','2016-12-29 17:08:25.229901' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 4,'admin','0002_logentry_remove_auto_add','2016-12-29 17:08:25.640925' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 5,'contenttypes','0002_remove_content_type_name','2016-12-29 17:08:25.940942' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 6,'auth','0002_alter_permission_name_max_length','2016-12-29 17:08:26.218958' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 7,'auth','0003_alter_user_email_max_length','2016-12-29 17:08:26.518975' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 8,'auth','0004_alter_user_username_opts','2016-12-29 17:08:26.863994' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 9,'auth','0005_alter_user_last_login_null','2016-12-29 17:08:27.119009' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 10,'auth','0006_require_contenttypes_0002','2016-12-29 17:08:27.231015' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 11,'auth','0007_alter_validators_add_error_messages','2016-12-29 17:08:27.497031' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 12,'sessions','0001_initial','2016-12-29 17:08:27.730044' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 13,'personal','0001_initial','2016-12-29 22:00:29.247217' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 14,'personal','0002_auto_20161230_1230','2016-12-30 10:30:43.385980' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 15,'personal','0003_person_personal_id','2017-01-01 16:59:14.387930' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 16,'personal','0004_auto_20170101_1912','2017-01-01 17:12:26.890259' );
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES ( 17,'personal','0005_auto_20170119_2204','2017-01-19 20:05:02.228075' );




COMMIT;

-- ------------------------------------------
-- Dump of "django_session"
-- ------------------------------------------

DROP TABLE IF EXISTS "django_session";

CREATE TABLE "django_session"(
	"session_key" Text NOT NULL PRIMARY KEY,
	"session_data" Text NOT NULL,
	"expire_date" DateTime NOT NULL );

CREATE INDEX "django_session_de54fa62" ON "django_session"( "expire_date" );

BEGIN;

INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ( 'juto5v6jifejk4opg2dnpiq7czv4g0j8','ZjliNjRiOTM3OGYyMmE4NjRiMGY2Njk3MmUyNDg4Nzk3ZWM5ZWJmMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJlMWYzYWQ1Nzk5OTBiODYyYmUzNTBmNWMwZTI1ZDVjNTY0ZjE1N2IwIn0=','2017-01-12 22:01:38.593184' );
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ( '5v34q5yuc01k50dp19ts8uce1i6c82zm','NWFlMWIxOGU5MWNlNzk4MTdmYmI5YjUzMDdhOTgyZWI0MzE0YzM3NTp7ImRhdGEiOnsidXNlckxhc3RuYW1lIjoiRG9lIiwidXNlckxhc3Rsb2dpbiI6Ik5vbmUiLCJzdWNjZXNzIjp0cnVlLCJ1c2VyU3RhdHVzIjoiUGVyc29ubmVsIiwidXNlckFkZHJlc3MiOiJzYW5mZXJuYW5kb3MgMjU0MTIiLCJ1c2VySW5mbyI6IjMiLCJ1c2VyRW1haWwiOiJhYnJhQGkudWFzIiwidXNlckZpcnN0bmFtZSI6IkpvaG4iLCJ1c2VyUGhvdG8iOiJpbWcvSm9obkRvZV85M185NzcvNzE4RkdEeFlzZlFORF9ENXNYS0ZBZ19yLmpwZyIsInVzZXJJRCI6IjkzXzk3NyJ9fQ==','2017-01-16 19:41:48.628168' );
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ( 'llp59cyqhak8qdi8c09xjkhm2q0nn8w6','NjgyYWZhOGQ5NGRhOTE0ZWE3OTZmYzJhODA4NDNlMDFkMTkxN2E3ZTp7ImRhdGEiOnsidXNlckZpcnN0bmFtZSI6InRpc3RlciIsInVzZXJMYXN0bG9naW4iOiIyMDE3LTAxLTAyIDE5OjI2OjA0LjE5NDgzNiswMDowMCIsInVzZXJTdGF0dXMiOiJBZG1pbmlzdHJhdG9yIiwidXNlckVtYWlsIjoidGlzdGVyX3Rvc3RlckBpLnVhIiwidXNlclBob3RvIjoiIiwidXNlcklEIjoiMnRvc3RlciIsInN1Y2Nlc3MiOnRydWUsInVzZXJBZGRyZXNzIjoic2FucGVkcm9zIDU2NTAyIiwidXNlckxhc3RuYW1lIjoidG9zdGVyIiwidXNlckluZm8iOiIyIn0sIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTA2ZDRlODA4ZmIyM2YyM2FjMmY0OWU2NjRhMDM4NjkxNGRlNzlhOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-01-17 18:22:08.003266' );
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ( 'otv6fw0xm43do95jm8qn3ux92pss149v','NGEyNzg2ZDc3MTRmZjU4ZTU3NmFiNjI0ODUyYzdkMzFlOGJlYTUxNDp7InVzZXIiOjEzLCJfYXV0aF91c2VyX2hhc2giOiIyM2E0NDk4OWMxN2NmMDEwMzdjYmVmYTA5MmFjYzUzNjQzZjdkNzBhIiwiX2F1dGhfdXNlcl9pZCI6IjEzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2017-01-19 16:53:59.299659' );
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ( '6k2qdt67y9ekbaxt0vr5kz5cu5o2op0p','OTY3ZWI1OTczN2E0YWU0MmRlMTQxZTczMGEwMGU0MDY5NTI2OTA1Njp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsImluZm8iOnsidXNlcklEIjoiMTA3XzYzNyIsInN1Y2Nlc3MiOnRydWUsInVzZXJQaG90byI6Ii9tZWRpYS9pbWcvSm9oblRob3Juc21pdGhfMTA3XzYzNy9Lb2FsYS5qcGciLCJ1c2VyU3RhdHVzIjoiUGVyc29ubmVsIiwidXNlckxhc3Rsb2dpbiI6IjIwMTctMDEtMDkgMTM6MTEiLCJ1c2VyTGFzdG5hbWUiOiJUaG9ybnNtaXRoIiwidXNlckZpcnN0bmFtZSI6IkpvaG4iLCJ1c2VyRW1haWwiOiJqdEBpLnVhIiwidXNlckFkZHJlc3MiOiJDQSwgU2FuLVNlYmFzdGlvYW4sVG9ya3ZlbWFkYSBzdC4sIDE1ODkiLCJ1c2VySW5mbyI6IjE0In0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjNhNDQ5ODljMTdjZjAxMDM3Y2JlZmEwOTJhY2M1MzY0M2Y3ZDcwYSJ9','2017-01-24 10:52:42.739916' );
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ( 'i6zcydijijo8mtvopsz1mfb0rv3mm6w1','NGRiYzY4MGJmZmM4NDg5N2MyNzlhMThmMjZkMTczYzZhMjdlNDA0NTp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfaGFzaCI6IjIzYTQ0OTg5YzE3Y2YwMTAzN2NiZWZhMDkyYWNjNTM2NDNmN2Q3MGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImluZm8iOnsidXNlckxhc3Rsb2dpbiI6IjIwMTctMDEtMDkgMTM6MTEiLCJ1c2VyU3RhdHVzIjoiUGVyc29ubmVsIiwidXNlcklEIjoiMTA3XzYzNyIsInVzZXJFbWFpbCI6Imp0QGkudWEiLCJ1c2VyTGFzdG5hbWUiOiJUaG9ybnNtaXRoIiwidXNlckluZm8iOiIxNCIsInVzZXJQaG90byI6Ii9tZWRpYS9pbWcvSm9oblRob3Juc21pdGhfMTA3XzYzNy9Lb2FsYS5qcGciLCJzdWNjZXNzIjp0cnVlLCJ1c2VyRmlyc3RuYW1lIjoiSm9obiIsInVzZXJBZGRyZXNzIjoiQ0EsIFNhbi1TZWJhc3Rpb2FuLFRvcmt2ZW1hZGEgc3QuLCAxNTg5In19','2017-01-24 19:57:13.824595' );
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ( 'eyqxsdvqpkhae322fxa66fekrmljsdva','OThhYTg4MjI4Y2ZhMjY4NDg0ZjIwY2NiY2U1NzkxYTY3OGRkZTNhZjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiaW5mbyI6eyJ1c2VyUGhvdG8iOiIvbWVkaWEvaW1nL1NhbUh1bW1lcnNtaXRoXzEwNl8zMS9JZlQ1RzR2b3dHb19ueEtGVGxDLmpwZyIsInVzZXJGaXJzdG5hbWUiOiJTYW0iLCJ1c2VyRW1haWwiOiJzdXBlcmFnZW50QGdtYWlsLmNvbSIsInVzZXJTdGF0dXMiOiJQZXJzb25uZWwiLCJ1c2VyTGFzdGxvZ2luIjoiMjAxNy0wMS0xMyAxMToxNCIsInN1Y2Nlc3MiOnRydWUsInVzZXJJRCI6IjEwNl8zMSIsInVzZXJMYXN0bmFtZSI6Ikh1bW1lcnNtaXRoIiwidXNlckluZm8iOiJtZSIsInVzZXJBZGRyZXNzIjoiTlksIDI1MDY0LCBTdC1KZXJzZXksIExpbmtvbG4gYXYuLCAxNTQ4In0sIl9hdXRoX3VzZXJfaGFzaCI6IjIzYTQ0OTg5YzE3Y2YwMTAzN2NiZWZhMDkyYWNjNTM2NDNmN2Q3MGEifQ==','2017-01-27 11:19:57.851456' );
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ( 'dlpm2o4o631bxhu2fmgh1gw4pdkwvpsn','MmVlY2Q2Y2UwMzA0YTIxZTRiNjcwZjIyOTRjMTQwZjE0MTBiZDRkNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTFmM2FkNTc5OTkwYjg2MmJlMzUwZjVjMGUyNWQ1YzU2NGYxNTdiMCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-31 16:49:46.504649' );




COMMIT;

-- ------------------------------------------
-- Dump of "personal_person"
-- ------------------------------------------

DROP TABLE IF EXISTS "personal_person";

CREATE TABLE "personal_person"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"address" Text,
	"user_id" Integer NOT NULL,
	"personal_id" Text NOT NULL,
	"photo" Text,
	CONSTRAINT "personal_person_auth_user_NO ACTION_NO ACTION_user_id_id_0" FOREIGN KEY ( "user_id" ) REFERENCES "auth_user"( "id" )
,
CONSTRAINT "unique_user_id" UNIQUE ( "user_id" ) );


BEGIN;

INSERT INTO "personal_person" ("id","address","user_id","personal_id","photo") VALUES ( 11,'NY, 25064, St-Jersey, Linkoln av., 1548',13,'106_31','img/ASmith_106_31/ASmith.jpg' );
INSERT INTO "personal_person" ("id","address","user_id","personal_id","photo") VALUES ( 19,'IND, New Delhi, Rajastan av., 123',30,'41_6160','img/JavaharlalNeru_41_6160/3364218_8630b51a.jpeg' );
INSERT INTO "personal_person" ("id","address","user_id","personal_id","photo") VALUES ( 25,'PH, Hydra City, Fury av., 657',37,'147_9578','img/PhillCoulson_147_9578/PhillCoulson.jpg' );
INSERT INTO "personal_person" ("id","address","user_id","personal_id","photo") VALUES ( 26,'CN, Jelsomino, Radcat st., 25',38,'42_4140','img/MelindaMay_42_4140/may.jpg' );
INSERT INTO "personal_person" ("id","address","user_id","personal_id","photo") VALUES ( 27,'WP, Frozenmud, Whitewalkers st., 2',40,'147_7295','img/DaisyJohnson_147_7295/DaisyJohnson.jpg' );
INSERT INTO "personal_person" ("id","address","user_id","personal_id","photo") VALUES ( 28,'UK, Glastonberry, McDougal rd. 563',41,'77_3474','img/JamesBond_77_3474/jb.jpg' );
INSERT INTO "personal_person" ("id","address","user_id","personal_id","photo") VALUES ( 29,'CH, Shweinshwartznoensvertter, Rottenblumenstasse, 1',42,'148_786','img/JemmaSimmons_148_786/skye.jpg' );
INSERT INTO "personal_person" ("id","address","user_id","personal_id","photo") VALUES ( 30,'UK, Pibbls-city, McGregor sq., 58',43,'59_626','img/LeopoldFitz_59_626/Fitz.jpg' );




COMMIT;

