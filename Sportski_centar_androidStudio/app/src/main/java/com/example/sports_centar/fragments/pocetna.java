package com.example.sports_centar.fragments;



import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.example.sports_centar.R;


public class pocetna extends Fragment {

    public static pocetna newInstance() {
        pocetna fragment = new pocetna();
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
    public View onCreateView(LayoutInflater inflater, ViewGroup viewGroup,
                             Bundle savedInstanceState) {
       View view=inflater.inflate(R.layout.pocetna,viewGroup,false);
        return view;
    }

}
