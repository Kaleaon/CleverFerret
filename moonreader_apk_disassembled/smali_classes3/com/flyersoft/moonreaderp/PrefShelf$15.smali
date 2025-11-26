.class Lcom/flyersoft/moonreaderp/PrefShelf$15;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

.field final synthetic val$bold:Lcom/google/android/material/materialswitch/MaterialSwitch;

.field final synthetic val$filesEt:Landroid/widget/EditText;

.field final synthetic val$netEt:Landroid/widget/EditText;

.field final synthetic val$recentEt:Landroid/widget/EditText;

.field final synthetic val$shelfEt:Landroid/widget/EditText;

.field final synthetic val$sizeEt:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;Lcom/google/android/material/materialswitch/MaterialSwitch;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 648
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$bold:Lcom/google/android/material/materialswitch/MaterialSwitch;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$sizeEt:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$filesEt:Landroid/widget/EditText;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$netEt:Landroid/widget/EditText;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$shelfEt:Landroid/widget/EditText;

    iput-object p7, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$recentEt:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 651
    :try_start_0
    sget p1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    .line 652
    sget p2, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    .line 653
    sget v0, Lcom/flyersoft/tools/A;->recentCoverSize:I

    .line 655
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$bold:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->isChecked()Z

    move-result v1

    sput-boolean v1, Lcom/flyersoft/tools/A;->shelfBoldFont:Z

    .line 656
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$sizeEt:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    .line 657
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$filesEt:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/A;->fileCoverSize:I

    .line 658
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$netEt:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/A;->netCoverSize:I

    .line 659
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$shelfEt:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    .line 660
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$15;->val$recentEt:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sput v1, Lcom/flyersoft/tools/A;->recentCoverSize:I

    .line 661
    invoke-static {}, Lcom/flyersoft/tools/A;->verifyBookCoverSizes()V

    .line 663
    sget v1, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    const/4 v2, 0x1

    if-ne v1, p2, :cond_0

    sget p2, Lcom/flyersoft/tools/A;->shelfFontSize:I

    if-eq p2, p1, :cond_1

    .line 664
    :cond_0
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->main_shelf:Landroid/view/View;

    if-eqz p1, :cond_1

    .line 665
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_main_shelf(Z)Landroid/view/View;

    .line 667
    :cond_1
    sget p1, Lcom/flyersoft/tools/A;->recentCoverSize:I

    if-eq p1, v0, :cond_3

    .line 668
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz p1, :cond_2

    .line 669
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    invoke-virtual {p1, v2, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->showRecentLv(ZI)V

    .line 670
    :cond_2
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_3

    .line 671
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->init_dash_data(Z)Z

    .line 673
    :cond_3
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 674
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateDataSet()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 676
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    return-void
.end method
