"""Local preview server for Nameplate Studio (caching disabled)."""

import functools
import http.server
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))


class NoCacheHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-store, must-revalidate")
        self.send_header("Expires", "0")
        # Purge stale cache entries from earlier visits so HTML and its
        # scripts always come from the same version.
        self.send_header("Clear-Site-Data", '"cache"')
        super().end_headers()


if __name__ == "__main__":
    http.server.test(
        HandlerClass=functools.partial(NoCacheHandler, directory="."),
        port=4173,
    )
