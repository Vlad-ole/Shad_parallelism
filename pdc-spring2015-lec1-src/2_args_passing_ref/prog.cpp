#include <iostream>
#include <string>
#include <thread>

class htmldoc {
public:
    htmldoc(std::string const& content): content_(content) {}
    void setContent(std::string const& content) { content_ = content; }
    std::string const& getContent() const { return content_; }
        
private:
    std::string content_;
};

void load_htmldoc(htmldoc& doc)
{
    doc.setContent("Page1");
}

void process_htmldoc(htmldoc& doc)
{
    std::cout << "DOC: " << doc.getContent() << "\n";
}

int main() 
{
    htmldoc doc("DefaultPage");
    std::thread t(load_htmldoc, std::ref(doc));
    // Do ...
    t.join();
    process_htmldoc(doc);
    return 0;
}
