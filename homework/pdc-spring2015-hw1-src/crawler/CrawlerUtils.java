import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CrawlerUtils {

    public static Pattern linkPattern = Pattern.compile("<a href=\"([^\"#]+)\"");

    public static String getContent(URL url) {
        StringBuilder page = new StringBuilder ();
        BufferedReader in;
        try {
            URLConnection conn = url.openConnection();
            String contentType = conn.getContentType();
            if (contentType != null && contentType.startsWith("text/html")) {
                if (contentType.indexOf("charset=") == -1) {
                    in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
                } else {
                    String encoding = contentType.substring(contentType.indexOf("charset=") + 8);
                    in = new BufferedReader(new InputStreamReader(conn.getInputStream(), encoding));
                }
                String str;
                while ((str = in.readLine()) != null) {
                    page.append(str);
                }
                in.close();
                return page.toString();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Set<URI> getLinks(URL url, String content) {
        Set<URI> links = new HashSet<URI>();
        Matcher matcher = linkPattern.matcher(content);
        while (matcher.find()) {
            try {
                URI link = new URI(new URL(url, matcher.group(1)).toString());
                links.add(link);
            } catch (MalformedURLException e) {
            } catch (URISyntaxException e) {
            }
        }
        return links;
    }

    public static void main(String[] args) {
        BufferedWriter output = null;
        try {

            File dataFile = new File(args[0]);
            output = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(dataFile), "UTF-8"));

            URL page = new URL(args[1]);
            
            String content = getContent(page);
            if (content != null) { // HTML content found!
                output.write(page + "\t" + content + "\n");

                Set<URI> links = getLinks(page, content);
                System.out.println("Found " + links.size() + " links:");
                for (URI link : links) {
                    System.out.println(link);
                }
            }

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}