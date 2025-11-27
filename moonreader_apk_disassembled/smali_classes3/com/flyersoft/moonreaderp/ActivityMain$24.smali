.class Lcom/flyersoft/moonreaderp/ActivityMain$24;
.super Landroid/os/Handler;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 2676
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10

    .line 2679
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 2682
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1

    .line 2683
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v7, p1

    check-cast v7, Ljava/lang/String;

    .line 2684
    sget-object p1, Lcom/flyersoft/opds/N;->lastBookEntry:Lcom/flyersoft/opds/OpdsEntry;

    invoke-virtual {p1}, Lcom/flyersoft/opds/OpdsEntry;->getSelectedUrl()Ljava/lang/String;

    move-result-object v6

    .line 2685
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibrary:Lcom/flyersoft/opds/OpdsSite;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 2686
    const-string p1, "username"

    const-string v0, ""

    invoke-interface {v5, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2687
    const-string v1, "password"

    invoke-interface {v5, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getDecryptText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2689
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->input_userpass:I

    const/4 v8, 0x0

    invoke-virtual {v1, v2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 2690
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->iUserEdit:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 2691
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->iPassEdit:I

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 2692
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->iRememberMe:I

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    .line 2693
    invoke-virtual {v2, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2694
    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2696
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v9, Lcom/flyersoft/moonreaderp/R$string;->login:I

    invoke-virtual {v0, v9}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$24;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    const v1, 0x104000a

    .line 2697
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    .line 2717
    invoke-virtual {p1, v0, v8}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_1
    :goto_0
    return-void
.end method
