package ru.itis.kpfu.demo.genetic_algoritm.test;

import java.io.FileWriter;
import java.io.IOException;

public class Test {
    public static void main(String[] args) throws IOException {
        FileWriter fileWriter = new FileWriter("test.txt");
        for (int i = 0; i < 20; i++) {
            for (int j = 0; j < 20; j++) {
                fileWriter.write(i*j+1 + "");
                fileWriter.write(" ");

            }
            fileWriter.write("\n");
        }
        fileWriter.close();
    }
}
