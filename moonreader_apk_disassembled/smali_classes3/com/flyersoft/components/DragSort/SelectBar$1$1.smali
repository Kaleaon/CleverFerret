.class Lcom/flyersoft/components/DragSort/SelectBar$1$1;
.super Ljava/lang/Object;
.source "SelectBar.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DragSort/SelectBar$1;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DragSort/SelectBar$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 228
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const/4 p2, 0x0

    const/4 p4, 0x0

    move-object v0, p2

    const/4 p5, 0x0

    .line 231
    :goto_0
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getChildCount()I

    move-result v1

    if-ge p5, v1, :cond_1

    .line 232
    invoke-virtual {p1, p5}, Landroid/widget/AdapterView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/TextView;

    if-eqz v1, :cond_0

    .line 233
    invoke-virtual {p1, p5}, Landroid/widget/AdapterView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    :cond_0
    add-int/lit8 p5, p5, 0x1

    goto :goto_0

    .line 235
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result p5

    if-eqz p5, :cond_2

    if-eqz v0, :cond_2

    const p5, -0x222223

    .line 236
    invoke-virtual {v0, p5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 238
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-object p5, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-wide v3, p5, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$start_time:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x5dc

    cmp-long p5, v1, v3

    if-lez p5, :cond_7

    .line 239
    iget-object p5, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-object p5, p5, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$items:[Ljava/lang/CharSequence;

    array-length p5, p5

    const/4 v1, 0x1

    sub-int/2addr p5, v1

    if-ne p3, p5, :cond_5

    .line 240
    iget-object p5, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-object p5, p5, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-object v2, v2, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    iget-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-object p2, p2, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getSelectedWord()Ljava/lang/String;

    move-result-object p2

    :goto_1
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getTag()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_4

    const/4 p4, 0x1

    :cond_4
    invoke-static {p5, p2, v0, p4}, Lcom/flyersoft/components/DictPackage;->showDictApps(Landroid/content/Context;Ljava/lang/String;Landroid/widget/TextView;Z)V

    .line 242
    :cond_5
    iget-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-object p2, p2, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$items:[Ljava/lang/CharSequence;

    array-length p2, p2

    add-int/lit8 p2, p2, -0x2

    if-ge p3, p2, :cond_7

    iget-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-object p2, p2, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$context:Landroid/content/Context;

    invoke-static {p2, p3}, Lcom/flyersoft/tools/A;->getDictUrl(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p2

    const-string p3, "Customized"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 243
    new-instance p2, Landroid/widget/EditText;

    iget-object p3, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-object p3, p3, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$context:Landroid/content/Context;

    invoke-direct {p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 244
    iget-object p3, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-object p3, p3, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$dict_sp2:Landroid/widget/Spinner;

    if-ne p1, p3, :cond_6

    sget-object p3, Lcom/flyersoft/tools/A;->my_dict_url2:Ljava/lang/String;

    goto :goto_2

    :cond_6
    sget-object p3, Lcom/flyersoft/tools/A;->my_dict_url:Ljava/lang/String;

    :goto_2
    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 245
    invoke-virtual {p2, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 246
    new-instance p3, Lcom/flyersoft/components/MyDialog;

    iget-object p4, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-object p4, p4, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$context:Landroid/content/Context;

    invoke-direct {p3, p4}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget p4, Lcom/flyersoft/moonreaderp/R$string;->my_dict_hint:I

    invoke-static {p4}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p3

    invoke-virtual {p3, p2}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p3

    new-instance p4, Lcom/flyersoft/components/DragSort/SelectBar$1$1$1;

    invoke-direct {p4, p0, p1, p2}, Lcom/flyersoft/components/DragSort/SelectBar$1$1$1;-><init>(Lcom/flyersoft/components/DragSort/SelectBar$1$1;Landroid/widget/AdapterView;Landroid/widget/EditText;)V

    const p1, 0x104000a

    .line 247
    invoke-virtual {p3, p1, p4}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 254
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_7
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
