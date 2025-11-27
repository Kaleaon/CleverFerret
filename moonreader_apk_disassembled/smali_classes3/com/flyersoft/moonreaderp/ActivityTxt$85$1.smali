.class Lcom/flyersoft/moonreaderp/ActivityTxt$85$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$85;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$85;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$85;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9805
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$85$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$85;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$85$1;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 9808
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$85$1;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->tts_stop_time:I

    .line 9809
    sget p1, Lcom/flyersoft/tools/A;->tts_stop_time:I

    const/4 p2, 0x1

    if-ge p1, p2, :cond_0

    .line 9810
    sput p2, Lcom/flyersoft/tools/A;->tts_stop_time:I

    .line 9811
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$85$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$85;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$85;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tts_stop_record_time:J

    .line 9812
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$85$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$85;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$85;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateTtsStopIndicator(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 9813
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$85$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$85;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$85;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetStopTtsHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
