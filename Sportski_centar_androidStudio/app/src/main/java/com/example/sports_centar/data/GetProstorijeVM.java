package com.example.sports_centar.data;

import java.io.Serializable;
import java.util.List;

public class GetProstorijeVM implements Serializable {
    public List<Row> rows;

    public class Row implements Serializable
    {
        public int ProstorijaID;
        public String Naziv;
    }
}
