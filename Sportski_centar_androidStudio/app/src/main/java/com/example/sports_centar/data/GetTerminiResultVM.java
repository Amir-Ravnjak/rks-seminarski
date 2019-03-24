package com.example.sports_centar.data;

import java.io.Serializable;
import java.util.List;

public class GetTerminiResultVM implements Serializable {
    public List<Row> rows;
    public class Row implements Serializable
    {
        public int TerminID;
        public String nazivProstorije;
        public String Datum;
        public String Pocetak;
        public String Kraj;
        public String Cijena;
        public boolean Slobodan;
    }
}
