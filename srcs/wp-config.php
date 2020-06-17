<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('FS_METHOD', 'direct');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'tlBGZov[$G(pHy>[tElI+h@Y~MB&sIl,0kKth5LYT11om`@njTr(5+uAFp<*ZTF0' );
define( 'SECURE_AUTH_KEY',  '`>a78otPrU_Ov`NT<-dIn~]`32 ~]L3uye?U_0>D;Uj#3f*TM:51<co-QQ>hGM`S' );
define( 'LOGGED_IN_KEY',    '5EHBo?sM_+^~z%m8P!S1$PH@;)!kmJtdS8FNudY4v5Lr trzGM!+!ZaWbIsXe-w=' );
define( 'NONCE_KEY',        'pj,s~o~^ieWZol~6e:DAljye=s:NU =.pT#m?H?D;_{,D>9p2pRl6uT;,yb]1D P' );
define( 'AUTH_SALT',        '_zZ)K7-B8Vj,s4.dNm4 cTx&*UQmmJq.mVm?1u+-=kFAK3+U]3;F4${FL@PN*v%#' );
define( 'SECURE_AUTH_SALT', 'jqT@7m$1g%w=4@X$g^)5o.+@d[N*`7DbF7m3|p*RuPur^-6d}LQHq7>.*WGj|AF|' );
define( 'LOGGED_IN_SALT',   'L8,k)-G~oP5/8 $p?mjP0`+1CuglCKkp/l /IS+.E+Vr!-p(@idZ/d:l|KJE]GZI' );
define( 'NONCE_SALT',       '`;J}++|crKe`p|pa|k~&yf8:t$vKb[)+y%/Op`Z4=6K!nh6qC0|}S5J53;/7jLJz' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
