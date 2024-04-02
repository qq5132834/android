package com.example.livestream;

import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.example.livestream.databinding.ActivityCameraBinding;

public class CameraActivity extends AppCompatActivity {

    private ActivityCameraBinding activityCameraBinding;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_camera);
        this.activityCameraBinding = ActivityCameraBinding.inflate(getLayoutInflater());

        System.out.println(this.getClass().getName());
    }
}
