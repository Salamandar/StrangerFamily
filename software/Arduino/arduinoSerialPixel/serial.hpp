
#include "rBase64.h"

// Sélectionner le mode du format de trame
enum class mode { serialized, base64 };
const mode current_mode = mode::base64;

// Format de trame base64:
// >XX:YYYY=
// Exemple :
// >26:e9wO=
// XX = numéro de led à contrôler, en sérialisé (on peut changer ça)
// YYYY = données RGB, encodées en base64
// '=' est le symbole de "byte stuffing" de la base64, donc c'est pratique de
// l'utiliser comme séparateur de fin de chaîne

// Format de trame serialized:
// >XX:RRR,GGG,BBB.
// Exemple :
// >26:123,220,14.

void flush_stream(Stream& serial){
  while(serial.available()) serial.read();
}


void serial_init() {
    Serial.begin(115200);
}

int receive_number(char const& separator) {
    char buffer[8];
    bool separator_found = false;

    for (size_t i = 0; i < 7; i++) {
        auto c = Serial.read();
        if (isdigit(c)) {
            buffer[i] = c;
            continue;
        }
        if (c == separator) {
          buffer[i] = '\0';
          separator_found = true;
          break;
        }
        if (c == -1) {
            i--;
            continue;
        }
        // if we are here it's an error
        return -1;
    }

    if (not separator_found) {
        return -1;
    }

    // Deserialize the int
    return atoi(buffer);
}

void receive_eol() {
    // What if we receive \r\n ??
    while(true) {
        char c = Serial.read();
        if (c == '\n') return;
        if (c == '\r') return;
    }
}

void receive_start() {
    while(true) {
        char c = Serial.read();
        if (c == '>') return;
    }
}

int receive_base64(char const& separator) {
    char buffer[32];
    bool separator_found = false;

    for (size_t i = 0; i < 30; i++) {
        auto c = Serial.read();
        Serial.println(c);
        if (isdigit(c) or
            isalpha(c) or
            (c == '+') or
            (c == '/')) {
            buffer[i] = c;
            continue;
        }
        if (c == separator) {
          buffer[i] = '\0';
          separator_found = true;
          break;
        }
        if (c == -1) {
            i--;
            continue;
        }
        // if we are here it's an error
        return -1;
    }

    if (not separator_found) {
        return -1;
    }

    auto err = rbase64.decode(buffer);
    if (err != RBASE64_STATUS_OK) {
        return -1;
    }

    return 0;
}

int parse_base64(uint8_t& _R, uint8_t& _G, uint8_t& _B) {
    char* data = rbase64.result();
    _R = uint16_t(data[0]);
    _G = uint16_t(data[1]);
    _B = uint16_t(data[2]);
    return 0;
}

void receive(int& _id, uint8_t& _R, uint8_t& _G, uint8_t& _B) {
    // Synchronize with an incoming '>'
    // Serial.println("Starting...");
    receive_start();

    // Serial.println("> received, continue...");
    // Read the serialized int up to the separator
    int id = receive_number(':');
    Serial.print("id = ");
    Serial.println(id);
    if (id == -1) return;

    if (current_mode == mode::serialized) {
        // Now read the serialized data
        int R = receive_number(',');
        if (R == -1) return;
        int G = receive_number(',');
        if (G == -1) return;
        int B = receive_number('.');
        if (B == -1) return;

        // return the data only if everything is good
        _id = id;
        _R = R;
        _G = G;
        _B = B;
    }

    if (current_mode == mode::base64) {
      // Serial.println("Going Base64...");
      if (receive_base64('=') == -1) return;
      _id = id;
      parse_base64(_R, _G, _B);
    }
}

void serial_notify(int const& _id, int const& _R, int const& _G, int const& _B) {
    // Send info to the python script
    String line;
    line.reserve(80);
    line = "ID: " + String(_id);
    line += ", R: " + String(_R);
    line += ", G: " + String(_G);
    line += ", B: " + String(_B);
    Serial.println(line);
}
