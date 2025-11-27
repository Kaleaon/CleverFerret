.class Lcom/flyersoft/moonreaderp/ActivityTxt$229;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initMp3Lay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field lastSetTime:J

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 21033
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$229;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 3

    if-eqz p3, :cond_1

    .line 21045
    new-instance p2, Landroid/text/format/Time;

    invoke-direct {p2}, Landroid/text/format/Time;-><init>()V

    .line 21046
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p3

    int-to-long v0, p3

    invoke-virtual {p2, v0, v1}, Landroid/text/format/Time;->set(J)V

    .line 21047
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$229;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p3, p3, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3Eclapsed:Landroid/widget/TextView;

    const-string v0, "%M:%S"

    invoke-virtual {p2, v0}, Landroid/text/format/Time;->format(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21048
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p2

    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$229;->lastSetTime:J

    sub-long/2addr p2, v0

    const-wide/16 v0, 0x320

    cmp-long v2, p2, v0

    if-lez v2, :cond_0

    .line 21049
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p2

    iput-wide p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$229;->lastSetTime:J

    .line 21050
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$229;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 21052
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$229;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getMp3Handler()Landroid/os/Handler;

    move-result-object p1

    const/4 p2, 0x0

    const-wide/16 v0, 0x3e8

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    .line 21035
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$229;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->mp3:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    return-void
.end method
