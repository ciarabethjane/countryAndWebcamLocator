final String CAM_USA = "http://128.252.39.27:80/SnapshotJPEG?Resolution=640x480&amp;Quality=Clarity&amp;1603046874";
final String CAM_CANADA = "http://184.70.14.182:80/mjpg/video.mjpg";
final String CAM_GERMANY = "http://212.184.13.107:8081/cgi-bin/faststream.jpg?stream=half&fps=15&rand=COUNTER";
final String CAM_JAPAN = "http://124.247.184.21:80/cgi-bin/camera?resolution=640&amp;quality=1&amp;Language=0&amp;1603047809";
final String CAM_CHINA = "http://183.237.98.133:8084/webcapture.jpg?command=snap&channel=1?1603047985";
final String CAM_AUSTRALIA = "http://110.144.34.151:8888/videostream.cgi?user=admin&pwd=";
final String CAM_IRELAND = "http://31.170.4.210:80/cgi-bin/viewer/video.jpg?r=1603048586";


String [] countries = { "GERMANY", "USA", "CANADA", "JAPAN", "CHINA", "AUSTRALIA", "IRELAND" };
float [] latitudes  = { 51.165691, 37.090240, 56.130367, 36.204823, 35.861660, -25.2744, 53.1424 };
float [] longitudes = { 10.451526, -95.712891, -106.346771, 138.252930, 104.195396, 133.7751, -7.6921 };

String [] webcameras = { CAM_GERMANY, CAM_USA, CAM_CANADA, CAM_JAPAN, CAM_CHINA, CAM_AUSTRALIA, CAM_IRELAND };

String webcamClosestTo(float x, float y) {
  float closestDistance = 100000.0;
  int closestCameraIndex = -1;
  
  for (int i = 0; i < countries.length; i += 1) {
    float camX = map(longitudes[i], -180, 180, 0, width);
    float camY = map(latitudes[i], 90, -90, 0, height);
    if (dist(x, y, camX, camY) < closestDistance) {
      closestCameraIndex = i;
      closestDistance = dist(x, y, camX, camY);
    }
  }
  
  if (closestCameraIndex != -1) {
    return webcameras[closestCameraIndex];
  }
  
  return null;
}
