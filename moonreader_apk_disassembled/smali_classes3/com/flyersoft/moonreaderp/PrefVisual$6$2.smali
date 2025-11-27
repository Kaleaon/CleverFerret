.class Lcom/flyersoft/moonreaderp/PrefVisual$6$2;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual$6;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefVisual$6;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual$6;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 387
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$6$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 389
    invoke-static {}, Lcom/flyersoft/tools/A;->getFileType()I

    move-result p2

    const/4 p3, 0x2

    if-eq p2, p3, :cond_2

    invoke-static {}, Lcom/flyersoft/tools/A;->getFileType()I

    move-result p2

    const/4 p3, 0x7

    if-ne p2, p3, :cond_0

    goto :goto_0

    .line 391
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkSpinnerItemNightState(Landroid/widget/AdapterView;)V

    .line 392
    invoke-static {}, Lcom/flyersoft/tools/A;->getTextEncodes()[Ljava/lang/CharSequence;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$6$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$6;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefVisual$6;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefVisual;->encodeSp:Landroid/widget/Spinner;

    invoke-virtual {p2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p2

    aget-object p1, p1, p2

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 393
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$6$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$6;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefVisual$6;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefVisual;->fileEncoding:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 394
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$6$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$6;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefVisual$6;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p2, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mencodingError(Lcom/flyersoft/moonreaderp/PrefVisual;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    .line 396
    :cond_1
    sput-object p1, Lcom/flyersoft/tools/A;->textEncode:Ljava/lang/String;

    .line 397
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string p3, "file_encoding"

    const/4 p4, 0x0

    invoke-virtual {p2, p3, p4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    sget-object p3, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-interface {p2, p3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 398
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string p3, "options1002"

    invoke-virtual {p2, p3, p4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string p3, "textEncode"

    invoke-interface {p2, p3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 399
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$6$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$6;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual$6;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshTxtRender(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method
