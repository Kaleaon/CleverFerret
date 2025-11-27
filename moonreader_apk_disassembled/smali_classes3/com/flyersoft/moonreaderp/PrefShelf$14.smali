.class Lcom/flyersoft/moonreaderp/PrefShelf$14;
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


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 623
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$14;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 626
    sget p1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    .line 627
    sget p2, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    .line 628
    sget v0, Lcom/flyersoft/tools/A;->recentCoverSize:I

    .line 629
    invoke-static {}, Lcom/flyersoft/tools/A;->setDefaultBookCoverSizes()V

    .line 631
    sget v1, Lcom/flyersoft/tools/A;->shelfCoverSize:I

    const/4 v2, 0x1

    if-ne v1, p2, :cond_0

    sget p2, Lcom/flyersoft/tools/A;->shelfFontSize:I

    if-eq p2, p1, :cond_1

    .line 632
    :cond_0
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->main_shelf:Landroid/view/View;

    if-eqz p1, :cond_1

    .line 633
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_main_shelf(Z)Landroid/view/View;

    .line 635
    :cond_1
    sget p1, Lcom/flyersoft/tools/A;->recentCoverSize:I

    if-eq p1, v0, :cond_3

    .line 636
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz p1, :cond_2

    .line 637
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    invoke-virtual {p1, v2, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->showRecentLv(ZI)V

    .line 638
    :cond_2
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentRv:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_3

    .line 639
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->init_dash_data(Z)Z

    .line 641
    :cond_3
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 642
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateDataSet()V

    .line 643
    :cond_4
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefShelf;->selfPref:Lcom/flyersoft/moonreaderp/PrefShelf;

    if-eqz p1, :cond_5

    .line 644
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefShelf;->selfPref:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$14;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefShelf;->coverB:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefShelf;->onClick(Landroid/view/View;)V

    :cond_5
    return-void
.end method
