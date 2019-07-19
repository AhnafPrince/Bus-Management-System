/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import static javax.swing.WindowConstants.DISPOSE_ON_CLOSE;

/**
 *
 * @author User
 */
public class InsertData extends JFrame{    
    private static String table_name;
    private static int col_no;
    private static String[] col_names;
    private String[] val;
    
    private JPanel jp = new JPanel();
    private JLabel[] jl;
    private JTextField[] jt;
    private JButton jb = new JButton("Insert");
    private JButton close_bttn = new JButton("Close");

    DBHandler ob1 = new DBHandler();

    public InsertData(String table_name, int col_no, String[] col_names) {
        this.table_name = table_name;
        this.col_no = col_no;

        ob1.setConnection("bus", "root", "");
        System.out.println(table_name + " " + col_no);

        setTitle("Insert data");
        setVisible(true);
        setSize(450, 400);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);

        jt = new JTextField[col_no + 1];
        jl = new JLabel[col_no + 1];
        val = new String[col_no + 1];

        int j = 20;

        for (int i = 0; i < col_no; i++) {
            jt[i] = new JTextField();
            jl[i] = new JLabel();

            jl[i].setBounds(10, j, 100, 30);
            jl[i].setText(col_names[i]);
            jt[i].setBounds(225, j, 160, 30);

            j += 40;
            
            add(jl[i]);
            add(jt[i]);
        }

        j += 50;
        jb.setBounds(60, j, 100, 35);
        close_bttn.setBounds(225, j, 100, 35);
        add(jb);
        add(close_bttn);
        add(jp);

        jb.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                
                for (int i = 0; i < col_no; i++) {
                    val[i] = jt[i].getText();
                    System.out.println(jt[i].getText());
                }                
                ob1.insertData(table_name, val);            
            }
        });

        close_bttn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dispose();
            }
        });
    }

    public static void main(String[] args) {
        InsertData t = new InsertData(table_name, col_no, col_names);
    }
    
}
