
import android.hardware.radio.RadioManager
import android.content.Context

class RadioTest(context: Context) {
    val radioManager = context.getSystemService(Context.RADIO_SERVICE) as RadioManager
}
