String encodeTLV(Map<String, String> data) {
  StringBuffer tlv = StringBuffer();

  data.forEach((key, value) {
    // Key type and value type definitions
    String keyType = 'LB'; // Assuming LB for label keys
    String valueType = 'VL'; // Assuming VL for value fields

    // Lengths
    int keyLength = key.length;
    int valueLength = value.length;

    // Append the TLV components
    tlv.write('$keyType$keyLength$key$valueType$valueLength$value');
  });

  return tlv.toString();
}

Map<String, String> decodeTLV(String tlv) {
  Map<String, String> data = {};
  int i = 0;

  while (i < tlv.length) {
    // Read the key type (e.g., LB)
    String keyType = tlv.substring(i, i + 2);
    i += 2; // Move past key type

    // Read the key length
    int keyLength = int.tryParse(tlv[i].toString()) ?? 0;
    i++; // Move past the length character

    // Read the key value based on its length
    String key = tlv.substring(i, i + keyLength);
    i += keyLength; // Move past the key value

    // Read the value type (e.g., VL)
    String valueType = tlv.substring(i, i + 2);
    i += 2; // Move past value type

    // Read the value length
    int valueLength = int.tryParse(tlv[i].toString()) ?? 0;
    i++; // Move past the length character

    // Read the value based on its length
    String value = tlv.substring(i, i + valueLength);
    i += valueLength; // Move index past the value

    // Store the key-value pair
    data[key] = value; // Use the key as the map key
  }

  return data;
}
