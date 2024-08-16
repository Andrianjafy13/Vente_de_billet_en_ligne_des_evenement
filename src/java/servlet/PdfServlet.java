

package servlet;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/generatePdf")
public class PdfServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les données depuis le formulaire ou une source de données
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String nombreBillet = request.getParameter("billet");
        String evenement = request.getParameter("evenement");
        String payment = request.getParameter("payment");

        // Créer le document PDF
        Document document = new Document();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            PdfWriter.getInstance(document, baos);
            document.open();
            document.add(new Paragraph("Billet d'événement"));
            document.add(new Paragraph(nom));
            document.add(new Paragraph(prenom));
            document.add(new Paragraph(email));
            document.add(new Paragraph(nombreBillet));
            document.add(new Paragraph(evenement));
            document.add(new Paragraph(payment));
            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        }

        // Configurer la réponse HTTP
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=billet.pdf");
        response.setContentLength(baos.size());

        // Envoyer le fichier PDF au client
        response.getOutputStream().write(baos.toByteArray());
        response.getOutputStream().flush();
    }
}
