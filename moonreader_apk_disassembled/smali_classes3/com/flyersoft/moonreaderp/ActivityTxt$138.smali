.class Lcom/flyersoft/moonreaderp/ActivityTxt$138;
.super Landroid/content/BroadcastReceiver;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initBroadcastReceiver()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
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

    .line 13930
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$138;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 13933
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    .line 13936
    const-string p2, "android.media.AUDIO_BECOMING_NOISY"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 13937
    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "ACTION_AUDIO_BECOMING_NOISY"

    const/4 v0, 0x0

    aput-object p2, p1, v0

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 13938
    sget-boolean p1, Lcom/flyersoft/tools/A;->isSpeaking:Z

    if-eqz p1, :cond_0

    .line 13939
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$138;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_paused:Z

    if-nez p1, :cond_0

    .line 13940
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$138;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpauseTTS(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    :cond_0
    return-void
.end method
