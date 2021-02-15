String lookupCountry(float latitude, float longitude){
  final String GEO_CODING_URL = "https://api.bigdatacloud.net/data/reverse-geocode-client?";
  
  String where = "latitude=" + latitude + "&longitude=" + longitude + "&localityLanguage=en";
  
  JSONObject result = loadJSONObject(GEO_CODING_URL + where);
  
  return result.getString("countryName");
}
