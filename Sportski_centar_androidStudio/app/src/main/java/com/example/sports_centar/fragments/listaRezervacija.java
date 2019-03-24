package com.example.sports_centar.fragments;


import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.ListView;
import android.widget.TextView;

import com.example.sports_centar.R;
import com.example.sports_centar.Util.Util;
import com.example.sports_centar.data.RezervacijeResultVM;
import com.example.sports_centar.helper.MyApiRequest;
import com.example.sports_centar.helper.MyRunnable;

import java.text.SimpleDateFormat;


public class listaRezervacija extends Fragment {

    public static final String ARG_PARAM1="KijentID";
    private ListView listaRezervacija;
    private String KlijentID;
    private RezervacijeResultVM podaci;

    public static listaRezervacija newInstance(int KlijentID) {
        listaRezervacija fragment = new listaRezervacija();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, String.valueOf(KlijentID));
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            KlijentID = getArguments().getString(ARG_PARAM1);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view= inflater.inflate(R.layout.rezervacije,container,false);

        listaRezervacija = view.findViewById(R.id.listaRezervacija);

        listaRezervacija.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                RezervacijeResultVM.Row x=podaci.rows.get(position);
                int rezervacijaID=x.RezervacijaID;
                Util.otvoriFragmentKaoReplace(getActivity(),R.id.mjestoZaFragment, Rezervacija.newInstance(rezervacijaID));
            }
        });

        PopuniPolja();

        return view;
    }

    private void PopuniPolja() {
        MyApiRequest.get(getActivity(), "api/Rezervacije/getRezervacijeByKlijentID/" + KlijentID, new MyRunnable<RezervacijeResultVM>() {
            public void run(RezervacijeResultVM x){
                podaci = x;
                PopuniPodatke();
            }
        });

    }

    private void PopuniPodatke() {
        if(podaci.rows.size()>0){
            listaRezervacija.setAdapter(new BaseAdapter() {
                @Override
                public int getCount() {
                    return podaci.rows.size();
                }

                @Override
                public Object getItem(int position) {
                    return null;
                }

                @Override
                public long getItemId(int position) {
                    return 0;
                }

                @Override
                public View getView(int position, View view, ViewGroup parent) {
                    if(view==null){
                        LayoutInflater inflater= (LayoutInflater) getActivity().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                        view=inflater.inflate(R.layout.rezervacija_stavka,parent,false);
                    }
                    TextView nazivProstorije = view.findViewById(R.id.nazivProstorije);
                    TextView vrijemeTermina = view.findViewById(R.id.terminRezervacije);
                    CheckBox odobrena = view.findViewById(R.id.cbOdobrena);

                    RezervacijeResultVM.Row x=podaci.rows.get(position);

                    nazivProstorije.setText(x.nazivProstorije);
                    vrijemeTermina.setText(x.terminInfo);
                    odobrena.setChecked(x.Odobrena);
                    odobrena.setEnabled(false);

                    return view;
                }
            });
        }


    }



}
