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

// ** MySQL settings ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'db:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '~8l+bd:1no$3J{2mrs^{}}dyQn4G^M0C}xRkYp 3ig|{$X9vsUqN+P`i{lg%KEc}' );
define( 'SECURE_AUTH_KEY',  'sGxK9MDBd4dYSAKJ;#Tp@{kwL6|cT#%)A|E^2Ag2rIzbygl `w*x`P5.u,bUGmN4' );
define( 'LOGGED_IN_KEY',    '-ASQdx+Av Eg]6+gCg6.mObWY]5,SB#qRe:As+k* `:CpV@E?6?1j{cq_R6i{t0-' );
define( 'NONCE_KEY',        'wKrs2hs;qZuduh@(U}$L5t3x3QZL,#[fFsiKlvqV{S2Tdj8a&,r{d33NF&X9RdU?' );
define( 'AUTH_SALT',        '3A(GW!8TdL7:#)G&<C8H<93_+BW?gmsP>yX;GTIs/Ezd?79L>W,ceQW;O/|@)gP/' );
define( 'SECURE_AUTH_SALT', 'Wn_q_ImLVgwI$eSu2x65PA3SmJv)?nO(XgBHjHZ_Rw=OuxgX< Tdz3ImJl-1?`%,' );
define( 'LOGGED_IN_SALT',   'XkC<LUR<j7AvYcK5qB _jA0|u?uf~LpMi84$~TN2&ae1z?aan1HE91pCN{@o qM4' );
define( 'NONCE_SALT',       'o#=}?C*WxVQC/$`<[x.&3RIUzP#(+H):.Pq:ZIiih.UA%ujDMYxZMEL{oVEag3kt' );

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';






define( 'WP_ALLOW_MULTISITE', true );
define( 'MULTISITE', true );
define( 'SUBDOMAIN_INSTALL', false );
$base = '/';
define( 'DOMAIN_CURRENT_SITE', 'landing.localhost' );
define( 'PATH_CURRENT_SITE', '/' );
define( 'SITE_ID_CURRENT_SITE', 1 );
define( 'BLOG_ID_CURRENT_SITE', 1 );

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
