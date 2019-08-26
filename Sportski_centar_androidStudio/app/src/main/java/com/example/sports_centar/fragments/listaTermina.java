package com.example.sports_centar.fragments;


import android.app.DatePickerDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.DatePicker;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;


import com.example.sports_centar.R;
import com.example.sports_centar.Util.Util;
import com.example.sports_centar.data.GetProstorijeVM;
import com.example.sports_centar.data.GetTerminiResultVM;
import com.example.sports_centar.helper.MyApiRequest;
import com.example.sports_centar.helper.MyRunnable;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


public class listaTermina extends Fragment {


    private GetTerminiResultVM podaci;
    private GetProstorijeVM prostorije;

    private TextView datum;
    private Spinner spnrProstorija;
    private Button trazi;
    private ListView termini;

    private Calendar calendar;
    private DatePickerDialog dialogCalendar;
    private int godina=0;
    private int mjesec;
    private int dan;
    private boolean odabranDatum=false;
    private String datumPretrage="noDate";
    private BaseAdapter adapter;
    private Button btnDatum;
    private List<String> naziviProstorija;

    public static listaTermina newInstance() {
        listaTermina fragment = new listaTermina();
        Bundle args = new Bundle();

        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {

        }

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.termini, container, false);
        datum = view.findViewById(R.id.tvDatum);
        trazi = view.findViewById(R.id.btnTrazi);
        termini = view.findViewById(R.id.listaTermina);
        
        spnrProstorija = view.findViewById(R.id.spnrProstorija);

        datum.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                calendar = Calendar.getInstance();
                int year;
                int day;
                int month;
                if(godina==0){
                day = calendar.get(Calendar.DAY_OF_MONTH);
                month= calendar.get(Calendar.MONTH);
                year = calendar.get(Calendar.YEAR)
                }
                else{
                day=dan;
                    month=mjesec;
                    year=godina;
                    
                }
                dialogCalendar=new DatePickerDialog(getActivity(), android.R.style.Theme_Holo_Light_Dialog_MinWidth, new DatePickerDialog.OnDateSetListener() {
                    @Override
                    public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
                        godina=year;
                        mjesec=month;
                        dan=dayOfMonth;
                        odabranDatum=true;
                    }
                }, year, month, day);
                dialogCalendar.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                dialogCalendar.show();

                dialogCalendar.setOnDismissListener(new DialogInterface.OnDismissListener() {
                    @Override
                    public void onDismiss(DialogInterface dialogInterface) {
                        if(dan>0 && mjesec>0 && godina >0)
                            datum.setText(dan+"."+(mjesec+1)+"."+godina+".");
                    }
                });
            }
        });

        trazi.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                popuniPodatkeTask();
            }
        });

        termini.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {


                String cijena= podaci.rows.get(position).Cijena;
                String datum= podaci.rows.get(position).Datum;
                String pocetak = podaci.rows.get(position).Pocetak;
                String kraj = podaci.rows.get(position).Kraj;

                String terminInfo = datum+" - "+pocetak+"-"+kraj;
                String nazivProstorije = podaci.rows.get(position).nazivProstorije;
                int TerminID = podaci.rows.get(position).TerminID;
                boolean slobodan = podaci.rows.get(position).Slobodan;
                Util.otvoriFragmentKaoReplace(getActivity(),R.id.mjestoZaFragment, Termin.newInstance(TerminID,cijena,nazivProstorije,terminInfo,slobodan));
            }
        });

        spnrProstorija.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent motionEvent) {

                if (motionEvent.getAction() == MotionEvent.ACTION_UP) {
                    popuniSpinner();
                }
                return false;
            }
        });



        return view;
    }

    private void popuniPodatkeTask() {
        if(odabranDatum)
            datumPretrage=(mjesec+1)+"-"+dan+"-"+godina;

        int prostorijaID=-1;

        int positionSpinner=spnrProstorija.getSelectedItemPosition();
        if(prostorije != null)
            prostorijaID=prostorije.rows.get(positionSpinner).ProstorijaID;

        MyApiRequest.get(getActivity(), "api/Termini/"+datumPretrage+","+prostorijaID, new MyRunnable<GetTerminiResultVM>() {

            @Override
            public void run(GetTerminiResultVM x) {
                if(x.rows.size()==0)
                {
                    Toast.makeText(getActivity(), "Nema dostupnih termina za ovu pretragu.",Toast.LENGTH_LONG).show();
                }
                else{
                    podaci = x;
                    popuniListu();
                }
            }
        });
    }
    private void popuniSpinner(){

        naziviProstorija = new ArrayList<>();

        MyApiRequest.get(getActivity(), "api/Prostorije", new MyRunnable<GetProstorijeVM>() {

            @Override
            public void run(GetProstorijeVM p) {

                prostorije = p;
                for (int i = 0; i < prostorije.rows.size(); i++) {
                    naziviProstorija.add(prostorije.rows.get(i).Naziv);
                }
                ArrayAdapter<String> spinnerAdapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_spinner_item, naziviProstorija);
                spinnerAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                spnrProstorija.setAdapter(spinnerAdapter);
            }
        });

    };

    private void popuniListu() {
        if (podaci.rows.size() > 0) {
            adapter = new BaseAdapter() {
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
                    if (view == null) {

                        final LayoutInflater inflater = (LayoutInflater) getActivity().getSystemService(Context.LAYOUT_INFLATER_SERVICE);

                        view = inflater.inflate(R.layout.termin_stavka, parent, false);
                    }
                    TextView prostorija = view.findViewById(R.id.nazivProstorije);
                    TextView tvTermin = view.findViewById(R.id.tvTermin);
                    TextView tvCijena = view.findViewById(R.id.tvCijena);
                    CheckBox cbSlobodan = view.findViewById(R.id.cbSlobodan);


                    GetTerminiResultVM.Row x = podaci.rows.get(position);

                    prostorija.setText(x.nazivProstorije);
                    tvTermin.setText(x.Datum + " - " +x.Pocetak+"-"+x.Kraj);
                    tvCijena.setText(x.Cijena+" KM");
                    cbSlobodan.setChecked(x.Slobodan);
                    cbSlobodan.setEnabled(false);

                    return view;
                }
            };

            termini.setAdapter(adapter);
        }
    }
}
