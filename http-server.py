import os
from urllib.parse import urlparse
import http.server

BASE_PATH = '%s/public' % os.getcwd()


class RequestHandler(http.server.SimpleHTTPRequestHandler):
    def translate_path(self, path):
        parsed_path = urlparse(path).path

        if parsed_path.startswith('/assets'):
            return '%s%s' % (BASE_PATH, parsed_path)

        return '%s/index.html' % BASE_PATH


http.server.test(RequestHandler, http.server.HTTPServer)
