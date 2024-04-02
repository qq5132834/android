package com.example.livestream;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.livestream.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {

    // Used to load the 'livestream' library on application startup.
    static {
        System.loadLibrary("livestream");
    }

    private ActivityMainBinding binding;

    private Button cameraButton;
    private TextView sampleText;

    /***
     * 初始化控件
     */
    private void init(){

        this.binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        this.cameraButton = this.binding.buttonPullStream;
        this.sampleText = this.binding.sampleText;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        this.init();

        // Example of a call to a native method
        this.sampleText.setText(stringFromJNI());

        this.cameraButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, CameraActivity.class);
                startActivity(intent);
            }
        });

    }

    /**
     * A native method that is implemented by the 'livestream' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();
}