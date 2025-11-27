.class Lcom/flyersoft/moonreaderp/ActivityTxt$97;
.super Landroid/content/BroadcastReceiver;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->show_tts_icon()V
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

    .line 10885
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$97;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 10887
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    .line 10888
    const-string p2, "mr.tts.stop"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 10889
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$97;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_stop:Landroid/view/View;

    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_tts_buttons(Landroid/view/View;Z)V

    .line 10891
    :cond_0
    const-string p2, "mr.tts.prior"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 10892
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$97;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_prior:Landroid/view/View;

    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_tts_buttons(Landroid/view/View;Z)V

    .line 10894
    :cond_1
    const-string p2, "mr.tts.play"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 10895
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$97;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_play:Landroid/view/View;

    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_tts_buttons(Landroid/view/View;Z)V

    .line 10897
    :cond_2
    const-string p2, "mr.tts.next"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 10898
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$97;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_next:Landroid/view/View;

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_tts_buttons(Landroid/view/View;Z)V

    :cond_3
    return-void
.end method
