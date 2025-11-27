.class public Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;
.super Landroid/widget/BaseAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FavListAdapter"
.end annotation


# instance fields
.field favs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookCollection;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method static bridge synthetic -$$Nest$minit(Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->init()V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 3467
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 3468
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->init()V

    return-void
.end method

.method private init()V
    .locals 3

    .line 3472
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "favorite"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, v2}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;IZ)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->favs:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 3476
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->favs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->favs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 3480
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    const/4 p3, 0x1

    if-nez p2, :cond_0

    .line 3490
    new-instance p2, Landroid/widget/TextView;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 3491
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setLines(I)V

    .line 3492
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_0

    .line 3494
    :cond_0
    check-cast p2, Landroid/widget/TextView;

    .line 3497
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->shelf_favorites:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 3498
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->favs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 3499
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->favs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    .line 3500
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->getCount()I

    move-result v1

    if-ne v1, p3, :cond_1

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->default_favorite_name:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3501
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->shelf_favorites:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 3503
    :cond_1
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v0, 0x41600000    # 14.0f

    .line 3504
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 3505
    sget-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v0, :cond_2

    const v0, -0x333334

    goto :goto_1

    :cond_2
    const v0, -0xafafb0

    :goto_1
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v0, 0x42900000    # 72.0f

    .line 3506
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {p2, v0, v2, v3, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 3507
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 3508
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    .line 3509
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->favs:Ljava/util/ArrayList;

    .line 3508
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_3

    sget v1, Lcom/flyersoft/tools/A;->shelf_category:I

    if-ne v1, p3, :cond_3

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$FavListAdapter;->favs:Ljava/util/ArrayList;

    .line 3509
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookCollection;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->encodeCollection(Lcom/flyersoft/tools/BookDb$BookCollection;)Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/flyersoft/tools/A;->shelf_sub_collection:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_2

    :cond_3
    const/4 p3, 0x0

    .line 3508
    :goto_2
    invoke-virtual {v0, p3}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    return-object p2
.end method
