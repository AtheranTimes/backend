# specify the VCL syntax version to use
vcl 4.1;

# import vmod_dynamic for better backend name resolution
import dynamic;

# import proxy
import proxy;

# set up a dynamic director
# for more info, see https://github.com/nigoroll/libvmod-dynamic/blob/master/src/vmod_dynamic.vcc
sub vcl_init {
    new d = dynamic.director(port = "80");
}

backend default {
    .host = "ghost:2368";
}

# acl purge {
#     "atherantimes.com";
#     "ghost";
# }

sub vcl_recv {

    if (proxy.is_ssl()) {
        set req.http.X-Forwarded-Proto = "https";
    } else {
        set req.http.X-Forwarded-Proto = "http";
    }

    # Do not cache the admin and preview pages
    if (req.url ~ "/(admin|p|ghost)/") {
        return (pass);
    }

    # # https://kruyt.org/ghost-blog-caching-with-varnish/
    # # not working rn
    # if (req.url ~ "/clearcache/ghost") {

    #     # Same ACL check as above:
    #     if (!client.ip ~ purge) {
    #         return(synth(403, "Not allowed."));
    #     }
    #     ban("req.http.host == atherantimes.com");

    #     # Throw a synthetic page so the
    #     # request won't go to the backend.
    #     return(synth(200, "Cache cleared"));
    # }
}

sub vcl_backend_response {
    if (beresp.http.content-type ~ "text/plain|text/css|application/json|application/x-javascript|text/xml|application/xml|application/xml+rss|text/javascript") {
        set beresp.do_gzip = true;
        set beresp.http.cache-control = "public, max-age=1209600";
    }
}