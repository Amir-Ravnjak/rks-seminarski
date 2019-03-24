package com.example.sports_centar.data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class RezervacijeResultVM implements Serializable {
    public List<Row> rows;

    public class Row implements Serializable
    {
        public int RezervacijaID;
        public String nazivProstorije;
        public String terminInfo;
        public boolean Odobrena;
    }
}
