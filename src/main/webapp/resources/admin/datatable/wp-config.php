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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wp');

/** MySQL database username */
define('DB_USER', 'ataur');

/** MySQL database password */
define('DB_PASSWORD', 'ataur');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

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
define('AUTH_KEY',         'n{OAoi?!rgqfz]m#hr?6JU^AopNJgDe*&Wu(|*uD`Ntw%Yk7i[MI%,0aK6Az8-x[');
define('SECURE_AUTH_KEY',  '<t_UJ >ZPaRm4y)Q6UhFN%iUlPeUn{))11yClig_AU~x_Wk@)I:Wk}u/p/<k-5kG');
define('LOGGED_IN_KEY',    'o!-XU`FqIZLqD, GBdKxoHn_xjaN(og[}4(Z_8DPw#EiY3TP*?Q0bH,y%F|K8ZV`');
define('NONCE_KEY',        '6n$wL6hTq$3bog4<f2?%o|Hps/7lnFT*vFpH2$VE/&?5n*tF6Ob]xSz]qo&zUYiC');
define('AUTH_SALT',        '(3Uf^[p}%<? Avr(CZ>(UegN]:KPCMbBaQb8n{5yLIqw{>,;e8kYk~Ia+3O{a.WL');
define('SECURE_AUTH_SALT', 'LC|wZJY=Gec;Ol^}N]T,srsw-/s9kA)1C(P+r.jWoB+=^::GM6X[vfha3)kq}MMu');
define('LOGGED_IN_SALT',   'R6gb#A<4goP$rRMH;5Q`-/:SS2pRG{/l_%Hx6.JLCybr:AL_<2v#ymrB cR0 jmN');
define('NONCE_SALT',       '(fvlOz,iBho63K[e!NQ1m^yBWcS:E,25>^W&q?{!f?_0qWI$aI28l8Eq*#g,_},u');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
