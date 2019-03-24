package com.example.sports_centar.fragments;



import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.TextView;

import com.example.sports_centar.R;
import com.example.sports_centar.data.GetRezervacijuResultVM;
import com.example.sports_centar.helper.MyApiRequest;
import com.example.sports_centar.helper.MyRunnable;

import org.w3c.dom.Text;

import java.text.SimpleDateFormat;


public class Rezervacija extends Fragment {

    public static final String ARG_PARAM1="rezervacijaID";
    private String rezervacijaID;
    private GetRezervacijuResultVM x;
    private TextView nazivProstorije;
    private TextView tvPocetak;
    private TextView tvKraj;
    private TextView cijenaRezervacije;
    private CheckBox cbOdobrena;
    private CheckBox cbUplaceno;

    public static Rezervacija newInstance(int rezervacijaID) {
        Rezervacija fragment = new Rezervacija();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, String.valueOf(rezervacijaID));

        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            rezervacijaID = getArguments().getString(ARG_PARAM1);        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.detalji_rezervacije,container,false);

        nazivProstorije = view.findViewById(R.id.nazivProstorije);
        tvPocetak = view.findViewById(R.id.tvPocetak);
        tvKraj = view.findViewById(R.id.tvKraj);
        cijenaRezervacije = view.findViewById(R.id.cijenaRezervacije);
        cbOdobrena = view.findViewById(R.id.cbOdobrena);
        cbUplaceno = view.findViewById(R.id.cbUplaceno);

        PopuniPodatke();
        return view;
    }

    private void PopuniPodatke() {
        MyApiRequest.get(getActivity(), "api/Rezervacije/"+rezervacijaID, new MyRunnable<GetRezervacijuResultVM>() {
            public void run(GetRezervacijuResultVM s){
                x=s;
                PopuniPolja();
            }
        });
    }

    private void PopuniPolja() {

        nazivProstorije.setText(x.nazivProstorije);
        tvPocetak.setText(x.Pocetak);
        tvKraj.setText(x.Kraj);
        cijenaRezervacije.setText(x.Cijena);
        cbOdobrena.setChecked(x.Odobrena);
        cbOdobrena.setEnabled(false);
        cbUplaceno.setChecked(x.Uplaceno);
        cbUplaceno.setEnabled(false);
    }

}
