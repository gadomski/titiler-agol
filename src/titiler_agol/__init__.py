from titiler.application.main import app
from titiler.core.factory import TilerFactory

agol = TilerFactory(router_prefix="/agol/1.0.0", extensions=[])
app.include_router(
    agol.router, prefix="/agol/1.0.0", tags=["Cloud Optimized GeoTIFF", "ArcGIS Online"]
)
