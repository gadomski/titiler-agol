"""AWS Lambda handler for titiler-agol."""

import logging

from mangum import Mangum
from titiler.application.settings import ApiSettings
from titiler_agol import app

logging.getLogger("mangum.lifespan").setLevel(logging.ERROR)
logging.getLogger("mangum.http").setLevel(logging.ERROR)

api_settings = ApiSettings()

handler = Mangum(app, api_gateway_base_path=api_settings.root_path, lifespan="auto")
