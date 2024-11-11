#include <iostream>
#include <cpprest/http_listener.h>

using namespace std;
using namespace web;
using namespace web::http;
using namespace web::http::experimental::listener;

void handle_get(http_request request) {
    ucout << "GET request received" << endl;
    json::value response_data;
    response_data[U("message")] = json::value::string(U("Hello World with C++"));
    request.reply(status_codes::OK, response_data);
}

int main() {
    uri_builder uri(U("http://localhost:8080/"));
    auto addr = uri.to_uri().to_string();
    http_listener listener(addr);

    listener.support(methods::GET, handle_get);

    try {
        listener
            .open()
            .then([&listener](){ ucout << "Starting to listen at: " << listener.uri().to_string() << endl; })
            .wait();

        string line;
        getline(cin, line);
    } catch (const exception& e) {
        cerr << "An error occurred: " << e.what() << endl;
    }

    return 0;
}