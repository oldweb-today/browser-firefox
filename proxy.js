
// Proxy Settings (Appended to user.js when proxy is set)
user_pref("network.proxy.http", "$PROXY_HOST");
user_pref("network.proxy.http_port", $PROXY_PORT);
user_pref("network.proxy.share_proxy_settings", true);
user_pref("network.proxy.ssl", "$PROXY_HOST");
user_pref("network.proxy.ssl_port", $PROXY_PORT);
user_pref("network.proxy.type", 1);


