
package servlet;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import java.io.ByteArrayOutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.UUID;
import modele.InsertionModele;

@WebServlet("/generateQRCode")
public class QRCodeServlet extends HttpServlet {
    
    private static int billetCounter = 1; // Compteur de billets
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // Générer une référence unique pour le billet
        String billetReference = generateBilletReference();
        
        String qrCodeText = "Billets Validé!! \n";
        String qrCodeText2 = "Référence de billet: " + billetReference;
        
        // Combiner les deux textes en un seul
        String combinedText = qrCodeText + " " + qrCodeText2;
        
        String filePath = "C:\\Users\\USER\\Documents\\NetBeansProjects\\MemoireFinal\\web\\image/qrCode.jpg";
        int width = 150;
        int height = 150;

        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = null;
        try {
            
           //bitMatrix = qrCodeWriter.encode(qrCodeText, BarcodeFormat.QR_CODE, width, height);
           
           bitMatrix = qrCodeWriter.encode(combinedText, BarcodeFormat.QR_CODE, width, height);
            
        } catch (WriterException e) {
            e.printStackTrace();
        }

        response.setContentType("image/png");
        OutputStream outputStream = response.getOutputStream();
        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", outputStream);
        response.setContentType("text/html");
        response.getWriter().println("<html><body><button>Telechager QRCode</button></body></html>");
        outputStream.close();
    }
    
    //VOICI LE CODE POUR FAIRE LE REFERENCE 
    private String generateBilletReference() {
        if (billetCounter > 999) {
            billetCounter = 1; // Reset counter if it exceeds 999
        }
        return String.format("%03d", billetCounter++);
       /* String uuid = UUID.randomUUID().toString().substring(0, 8); // Prendre les 8 premiers caractères
        int number = Math.abs(uuid.hashCode()) % 1000; // Convertir en nombre à 3 chiffres
        return String.format("%03d", number);*/
    }
}
