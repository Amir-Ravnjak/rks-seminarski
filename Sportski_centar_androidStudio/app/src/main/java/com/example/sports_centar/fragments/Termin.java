package com.example.sports_centar.fragments;


import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.TextView;
import android.widget.Toast;

import com.example.sports_centar.MainActivity;
import com.example.sports_centar.R;
import com.example.sports_centar.Util.Util;
import com.example.sports_centar.data.Global;
import com.example.sports_centar.data.RezervacijaPostVM;
import com.example.sports_centar.helper.MyApiRequest;
import com.example.sports_centar.helper.MyRunnable;


public class Termin extends Fragment {

    public static final String ARG_PARAM1="terminID";
    public static final String ARG_PARAM2="cijena";
    public static final String ARG_PARAM3="nazivProstorije";
    public static final String ARG_PARAM4="terminInfo";
    public static final String ARG_PARAM5 ="slobodan";
    public static final String ARG_PARAM6="prostorijaID";

    private String Cijena;
    private int terminID;
    private String terminInfo;
    private String nazivProstorije;
    private boolean slobodan;
    private TextView tvProstorija;
    private TextView tvTermin;
    private TextView cijena;
    private CheckBox cbSlobodan;

    public static Termin newInstance( int terminID,String cijena, String nazivProstorije, String terminInfo, boolean slobodan) {
        Termin fragment = new Termin();
        Bundle args = new Bundle();
        args.putSerializable(ARG_PARAM1,terminID);
        args.putSerializable(ARG_PARAM2,cijena);
        args.putSerializable(ARG_PARAM3,nazivProstorije);
        args.putSerializable(ARG_PARAM4,terminInfo);
        args.putSerializable(ARG_PARAM5,slobodan);

        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            terminID = (int) getArguments().getSerializable(ARG_PARAM1);
            Cijena =(String) getArguments().getSerializable(ARG_PARAM2);
            nazivProstorije = (String) getArguments().getSerializable(ARG_PARAM3);
            terminInfo = (String) getArguments().getSerializable(ARG_PARAM4);
            slobodan = (boolean) getArguments().getSerializable(ARG_PARAM5);

        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.termin_detalji, container, false);
        tvProstorija = view.findViewById(R.id.nazivProstorije);
        tvTermin = view.findViewById(R.id.Termin);
        cijena = view.findViewById(R.id.cijenaRezervacije);
        cbSlobodan = view.findViewById(R.id.Slobodan);
        PopuniPodatke();
        view.findViewById(R.id.btnRezervisi).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                RezervisiTermin();
            }
        });


        return view;
    }

    private void RezervisiTermin() {
        if(slobodan) {
            int klijentId = Global.prijavljeniKlijent.KlijentID;
            RezervacijaPostVM rezervacija = new RezervacijaPostVM();
            rezervacija.KlijentID = klijentId;
            rezervacija.TerminID = terminID;
            rezervacija.Odobrena = false;
            rezervacija.Uplaceno = false;
            MyApiRequest.post(getActivity(), "api/rezervacije/", rezervacija , new MyRunnable<RezervacijaPostVM>() {
                public void run(RezervacijaPostVM x) {
                }
            });
            MyApiRequest.post(getActivity(), "api/termini/"+terminID, null , null);
            Util.otvoriFragmentKaoReplace(getActivity(),R.id.mjestoZaFragment, listaTermina.newInstance());

            Toast.makeText(getActivity(), "Rezervacija uspjesno spasena.", Toast.LENGTH_LONG).show();
        }
        else{
            Toast.makeText(getActivity(), "Termin je već rezervisan.",Toast.LENGTH_LONG).show();
        }
    }
    private void PopuniPodatke() {

        tvProstorija.setText(nazivProstorije);
        tvTermin.setText(terminInfo);
        cijena.setText(Cijena+" KM");
        cbSlobodan.setChecked(slobodan);
    }

}
