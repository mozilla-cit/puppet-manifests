<?php
/** Enable W3 Total Cache */
define('WP_CACHE', true); // Added by W3 Total Cache

/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wpms_prod');

/** MySQL database username */
define('DB_USER', 'wpms');

/** MySQL database password */
define('DB_PASSWORD', 'password');

/** MySQL hostname */
define('DB_HOST', '15.125.20.173');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'G6]w#pg{@_cEAuWS@1W}&zz.v}&(1y,R*HP_fQ<~CL6Sxqud]O%!Gd%dz:7JtR I');
define('SECURE_AUTH_KEY',  'Ka$cD8Jca$nLY>BHPGq$#GRfRqgd(RsKvt-6%<gGJ$,[a2##~sf;+QOMd;v2}iTg');
define('LOGGED_IN_KEY',    '8AUBV2qS,2_i`7EEj85AF.R_w)FT5h f,m*]-w2~5<@0vB+(6h+{@y}`EyPJDL[+');
define('NONCE_KEY',        'xNT/#]dZWI.e>5sPuS=2bp~u8Ss#WWN9j=G?d4a=A$TJV-u/ID:iJdth=NtH@0B#');
define('AUTH_SALT',        'z{Ni]:a.*U+3|eyg_4><84?;$f^6|Z6*rfRRGnZ|L%6iQd.(^}m5EFYGTTR|7+^+');
define('SECURE_AUTH_SALT', '+pD0}4:00y+,vkZuIf|P4?W$+p(Rr(Wp+R&FI.-hx-Ky/HQW[OTtNc)M?.c;K+|+');
define('LOGGED_IN_SALT',   '|G*(Gf:KB#Ko}}l{A%sa-|uHY~o#6RsI<g|8g214Z=L=nI`?NtHpE6^MP~+16?CL');
define('NONCE_SALT',       'DJso!:[:9S<7F3I5m4:@{:Bxp|J6_s:n6q^# S&jS%7#MArp^t:?m_P?vN^F-?,b');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'subdir_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* Multisite */
define( 'WP_ALLOW_MULTISITE', true );
define('MULTISITE', true);
define('SUBDOMAIN_INSTALL', false);
define('DOMAIN_CURRENT_SITE', 'wpms.mozilla-community.org');
define('PATH_CURRENT_SITE', '/');
define('SITE_ID_CURRENT_SITE', 1);
define('BLOG_ID_CURRENT_SITE', 1);

define( 'SUNRISE', 'on' );

define('GLOBAL_SMTP_HOST','smtp.mandrillapp.com');
define('GLOBAL_SMTP_USER','logan@mozillausa.org');
define('GLOBAL_SMTP_PASSWORD','51_ujU4wBHIaEy8qIFudKw');

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
