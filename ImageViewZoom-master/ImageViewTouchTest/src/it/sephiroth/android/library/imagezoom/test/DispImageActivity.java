package it.sephiroth.android.library.imagezoom.test;

import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.test.utils.DecodeUtils;
import android.app.Activity;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore.Images;
import android.util.Log;
import android.view.WindowManager;
import android.widget.Toast;

public class DispImageActivity extends Activity {
	private static final String TAG = "DispImageActivity";
	ImageViewTouch mImage;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
				WindowManager.LayoutParams.FLAG_FULLSCREEN);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.disp_view);
		mImage = (ImageViewTouch) findViewById(R.id.disp_image);
		Bitmap bitmap = ((BitmapDrawable) getResources().getDrawable(
				R.drawable.test2)).getBitmap();
		Log.e(TAG, "bitmap : " + bitmap);
		mImage.setImageBitmap(bitmap, true, null, 5.0f);
		mImage.setSingleTapListener(new ImageViewTouch.OnImageViewTouchSingleTapListener() {

			@Override
			public void onSingleTap() {
				finish();
			}

		});
		// selectRandomImage();
	}

	private void selectRandomImage() {
		Log.e(TAG, "selectRandomImage");
		Cursor c = getContentResolver().query(
				Images.Media.EXTERNAL_CONTENT_URI, null, null, null, null);
		if (c != null) {
			int count = c.getCount();
			int position = (int) (Math.random() * count);
			if (c.moveToPosition(position)) {
				long id = c.getLong(c.getColumnIndex(Images.Media._ID));

				Uri imageUri = Uri.parse(Images.Media.EXTERNAL_CONTENT_URI
						+ "/" + id);
				Bitmap bitmap = DecodeUtils.decode(this, imageUri, 1280, 1280);
				if (null != bitmap) {
					// mImage.setMinZoom( 1.5f ); // you can set the minimum
					// zoom of the image ( must be called before anything else )
					// mImage.setFitToScreen( true ); // calling this will force
					// the image to fit the ImageView container width/height
					mImage.setImageBitmap(bitmap, true, null, 5.0f);
				} else {
					Toast.makeText(this, "Failed to load the image",
							Toast.LENGTH_LONG).show();
				}
			}
			c.close();
			c = null;
			return;
		}
	}
}
