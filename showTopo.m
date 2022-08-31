dem = GEOTIFF_READ('USGS_13_n48w124_20220505.tif');
dem.z = imread('USGS_13_n48w124_20220505.tif');
lat0 = 47.875;
lon0 = -123.75;

lonIndices = find( dem.x > lon0 & dem.x < lon0+0.125);
latIndices = find( dem.y > lat0 & dem.y < lat0+0.125);

[lon,lat] = ndgrid(dem.x,dem.y);
indices = lon > lon0 & lon < lon0+0.125 & lat > lat0 & lat <  lat0+0.125;

x = dem.x(lonIndices);
y = dem.y(latIndices);
z = dem.z(latIndices,lonIndices);

% figure, pcolor(x,y,z), shading interp

fpm = 3.28084;
levels40 = (1000:40:7000)/fpm;
levels200 = (1000:200:7000)/fpm;
figure
contour(x,y,z,levels40), hold on
contour(x,y,z,levels200,'LineWidth',1)

% print('haigs-topo-from-dem.png','-r300','-dpng')